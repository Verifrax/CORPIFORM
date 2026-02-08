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

# Ensure system is not dead or frozen
if grep -q "DEAD" STATUS.md; then
  echo "REFUSE: system is dead"
  exit 1
fi

if grep -q "FROZEN" STATUS.md; then
  echo "REFUSE: system is frozen"
  exit 1
fi

# Authority + policy gate
execution/gate.sh

# Execute exactly once
execution/execute_once.sh

# Emit receipt
execution/emit_receipt.sh

echo "EXECUTION COMPLETE"
exit 0
