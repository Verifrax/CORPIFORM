#!/usr/bin/env bash
set -euo pipefail

# EXECUTION GATE
# Central enforcement gate. No execution may proceed past this point
# without satisfying all authority and policy checks.

: "${AUTHORITY_SEAL_PATH:?REFUSE: AUTHORITY_SEAL_PATH not set}"
: "${EXECUTION_COMMAND_PATH:?REFUSE: EXECUTION_COMMAND_PATH not set}"
: "${EXECUTION_CUSTODIAN:?REFUSE: EXECUTION_CUSTODIAN not set}"

run_or_reject() {
  local script="$1"
  local reason="$2"

  if ! "$script"; then
    seals/reject_invalid.sh "$reason"
  fi
}

run_or_reject seals/require_auctoriseal.sh MISSING_AUTHORITY_SEAL
run_or_reject seals/verify_seal.sh INVALID_AUTHORITY_SEAL
run_or_reject seals/verify_scope.sh AUTHORITY_SCOPE_VIOLATION
run_or_reject seals/verify_time_window.sh AUTHORITY_TIME_WINDOW_VIOLATION
run_or_reject seals/verify_custody.sh AUTHORITY_CUSTODY_VIOLATION
run_or_reject seals/verify_revocation.sh AUTHORITY_REVOKED

execution/state_lock/acquire_lock.sh

echo "EXECUTION GATE PASSED"
exit 0
