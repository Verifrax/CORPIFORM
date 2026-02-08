#!/usr/bin/env bash
set -euo pipefail

# EXECUTION GATE
# Central enforcement gate. No execution may proceed past this point
# without satisfying all authority and policy checks.

# Required environment variables
: "${AUTHORITY_SEAL_PATH:?REFUSE: AUTHORITY_SEAL_PATH not set}"
: "${EXECUTION_COMMAND_PATH:?REFUSE: EXECUTION_COMMAND_PATH not set}"
: "${EXECUTION_CUSTODIAN:?REFUSE: EXECUTION_CUSTODIAN not set}"

# Authority presence
seals/require_auctoriseal.sh

# Authority verification
seals/verify_seal.sh
seals/verify_scope.sh
seals/verify_time_window.sh
seals/verify_custody.sh

# Acquire execute-once lock
execution/state_lock/acquire_lock.sh

# Execution permitted beyond this point
echo "EXECUTION GATE PASSED"

exit 0
