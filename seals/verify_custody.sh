#!/usr/bin/env bash
set -euo pipefail

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

ISSUED_TO=$(jq -r ".issued_to" "$SEAL_FILE")

if [[ -z "$ISSUED_TO" || "$ISSUED_TO" == "null" ]]; then
  echo "REFUSE: missing issued_to"
  exit 1
fi

if [[ "$ISSUED_TO" != "$CUSTODIAN_IDENTITY" ]]; then
  echo "REFUSE: custodian mismatch"
  exit 1
fi

echo "AUTHORITY CUSTODY VERIFIED"
exit 0
