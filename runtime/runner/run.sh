#!/usr/bin/env bash
set -euo pipefail

EARLY_CURRENT_STATE="$(
  awk '{
    line=$0
    gsub(/\*\*|`/, "", line)
    if (index(line, "CURRENT STATE:") == 1) {
      sub(/^CURRENT STATE:[[:space:]]*/, "", line)
      print line
      exit
    }
  }' STATUS.md
)"

case "$EARLY_CURRENT_STATE" in
  ACTIVE)
    ;;
  DEAD)
    echo "REFUSE: system is dead"
    exit 1
    ;;
  FROZEN)
    echo "REFUSE: system is frozen"
    exit 1
    ;;
  INACTIVE|"NON-FINAL / INACTIVE"|"NON_FINAL / INACTIVE"|"NON-FINAL"|"INACTIVE / NON-FINAL"|"NON-FINAL/INACTIVE")
    echo "REFUSE: system is inactive"
    exit 1
    ;;
esac

# CORPIFORM RUNTIME RUNNER
# Canonical, single-entry execution path. No branching. No retries.

# Required environment
: "${EXECUTION_COMMAND_PATH:?REFUSE: EXECUTION_COMMAND_PATH not set}"
: "${AUTHORITY_SEAL_PATH:?REFUSE: AUTHORITY_SEAL_PATH not set}"
: "${EXECUTION_CUSTODIAN:?REFUSE: EXECUTION_CUSTODIAN not set}"
: "${SYSTEM_FINGERPRINT:?REFUSE: SYSTEM_FINGERPRINT not set}"
: "${BUILD_HASH:?REFUSE: BUILD_HASH not set}"
: "${CORPIFORM_VERSION:?REFUSE: CORPIFORM_VERSION not set}"

# Canonical denial emission hook
export DENIAL_EMIT_SCRIPT="${DENIAL_EMIT_SCRIPT:-denials/emit.sh}"

CURRENT_STATE="$(
  awk '{
    line=$0
    gsub(/\*\*|`/, "", line)
    if (index(line, "CURRENT STATE:") == 1) {
      sub(/^CURRENT STATE:[[:space:]]*/, "", line)
      print line
      exit
    }
  }' STATUS.md
)"

if [[ -z "${CURRENT_STATE:-}" ]]; then
  echo "REFUSE: current state unresolved"
  if [[ -x "$DENIAL_EMIT_SCRIPT" ]]; then
    "$DENIAL_EMIT_SCRIPT" "STATUS_STATE_UNRESOLVED" || true
  fi
  exit 1
fi

case "$CURRENT_STATE" in
  ACTIVE)
    ;;
  DEAD)
    echo "REFUSE: system is dead"
    if [[ -x "$DENIAL_EMIT_SCRIPT" ]]; then
      "$DENIAL_EMIT_SCRIPT" "SYSTEM_DEAD" || true
    fi
    exit 1
    ;;
  FROZEN)
    echo "REFUSE: system is frozen"
    if [[ -x "$DENIAL_EMIT_SCRIPT" ]]; then
      "$DENIAL_EMIT_SCRIPT" "SYSTEM_FROZEN" || true
    fi
    exit 1
    ;;
  INACTIVE|"NON-FINAL / INACTIVE"|"NON_FINAL / INACTIVE"|"NON-FINAL"|"INACTIVE / NON-FINAL")
    echo "REFUSE: system is inactive"
    if [[ -x "$DENIAL_EMIT_SCRIPT" ]]; then
      "$DENIAL_EMIT_SCRIPT" "SYSTEM_INACTIVE" || true
    fi
    exit 1
    ;;
  *)
    echo "REFUSE: unsupported current state: $CURRENT_STATE"
    if [[ -x "$DENIAL_EMIT_SCRIPT" ]]; then
      "$DENIAL_EMIT_SCRIPT" "STATUS_STATE_UNSUPPORTED" || true
    fi
    exit 1
    ;;
esac

# Authority + policy gate
execution/gate.sh

# Execute exactly once
execution/execute_once.sh

# Emit receipt
execution/emit_receipt.sh

echo "EXECUTION COMPLETE"
exit 0
