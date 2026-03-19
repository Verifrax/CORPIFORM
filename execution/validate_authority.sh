#!/usr/bin/env bash
set -euo pipefail

# VALIDATE AUTHORITY
# Performs full authority validation as a single, atomic check.

# Required environment variables
: "${AUTHORITY_SEAL_PATH:?REFUSE: AUTHORITY_SEAL_PATH not set}"
: "${EXECUTION_COMMAND_PATH:?REFUSE: EXECUTION_COMMAND_PATH not set}"
: "${EXECUTION_CUSTODIAN:?REFUSE: EXECUTION_CUSTODIAN not set}"

# Authority validation sequence
seals/require_auctoriseal.sh || exit 1
seals/verify_seal.sh || exit 1
seals/verify_scope.sh || exit 1
seals/verify_time_window.sh || exit 1
seals/verify_custody.sh || exit 1

echo "AUTHORITY VALIDATED"
exit 0
