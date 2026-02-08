#!/usr/bin/env bash
set -euo pipefail

# DOCTOR
# Non-invasive integrity check for CORPIFORM.
# Detects structural, policy, and invariant violations.
# Performs NO mutation. Executes NOTHING.

echo "CORPIFORM DOCTOR"
echo "----------------"

FAIL=0

check_file() {
  if [[ ! -f "$1" ]]; then
    echo "MISSING FILE: $1"
    FAIL=1
  fi
}

check_dir() {
  if [[ ! -d "$1" ]]; then
    echo "MISSING DIR: $1"
    FAIL=1
  fi
}

# Core invariants
check_file STATUS.md
check_file CONTRACT.md
check_file SCOPE.md
check_file AUTHORITY.md
check_file FAILURE.md
check_file DEATH.md
check_file VERSION.md

# Identity
check_file id/SYSTEM_IDENTITY.md
check_file id/BUILD_HASH.txt
check_file id/fingerprints/corpiform.fingerprint
check_file id/TRUSTED_ROOTS/auctorseal_roots.json

# Policy
check_dir policy
check_file policy/allowed_actions.yml
check_file policy/forbidden_actions.yml

# Execution core
check_dir execution
check_file execution/gate.sh
check_file execution/execute_once.sh
check_file execution/emit_receipt.sh
check_file execution/refuse_without_seal.sh

# Ledger
check_dir ledger
check_dir ledger/receipts
check_dir ledger/denials
check_dir ledger/revocations
check_dir ledger/checkpoints

# Bodies
check_dir bodies

# Runtime
check_dir runtime
check_dir runtime/runner
check_file runtime/runner/run.sh

# Tools
check_dir tools
check_file tools/inspect.sh
check_file tools/freeze.sh
check_file tools/kill.sh

echo
if [[ "$FAIL" -eq 0 ]]; then
  echo "DOCTOR RESULT: HEALTHY"
  exit 0
else
  echo "DOCTOR RESULT: UNHEALTHY"
  exit 1
fi
