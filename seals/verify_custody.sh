#!/usr/bin/env bash
set -euo pipefail

# VERIFY AUTHORITY CUSTODY
# Ensures the execution is performed by the custodian explicitly named
# in the authority seal.

SEAL_FILE="${AUTHORITY_SEAL_PATH:-}"
CUSTODIAN_IDENTITY="${EXECUTION_CUSTODIAN:-}"

if [[ -z "$SEAL_FILE" || -z "$CUSTODIAN_IDENTITY" ]]; then
  echo "REFUSE: missing seal path or execution custodian"
  exit 1
fi

if [[ ! -f "$SEAL_FILE" ]]; then
  echo "REFUSE: authority seal file not found"
  exit 1
fi

SEAL_CUSTODIAN=$(jq -r '.custodian' "$SEAL_FILE")

if [[ -z "$SEAL_CUSTODIAN" || "$SEAL_CUSTODIAN" == "null" ]]; then
  echo "REFUSE: missing custodian in authority seal"
  exit 1
fi

if [[ "$SEAL_CUSTODIAN" != "$CUSTODIAN_IDENTITY" ]]; then
  echo "REFUSE: custodian mismatch"
  exit 1
fi

echo "AUTHORITY CUSTODY VERIFIED"
exit 0
