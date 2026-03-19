#!/usr/bin/env bash
set -euo pipefail

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
  python3 - <<'PY'
from pathlib import Path

for line in Path("STATUS.md").read_text().splitlines():
    if line.startswith("**CURRENT STATE:**"):
        print(line.split(":", 1)[1].replace(chr(96), "").strip())
        break
PY
)"

if [[ -z "${CURRENT_STATE:-}" ]]; then
  echo "REFUSE: current state unresolved"
  if [[ -x "$DENIAL_EMIT_SCRIPT" ]]; then
    "$DENIAL_EMIT_SCRIPT" "STATUS_STATE_UNRESOLVED" || true
  fi
  exit 1
fi

case "$CURRENT_STATE" in
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
esac

# Authority + policy gate
execution/gate.sh

# Execute exactly once
execution/execute_once.sh

# Emit receipt
execution/emit_receipt.sh

echo "EXECUTION COMPLETE"
exit 0
