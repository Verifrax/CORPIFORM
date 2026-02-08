#!/usr/bin/env bash
set -euo pipefail

# APPLY REVOCATION
# Records a verified authority revocation and enforces it prospectively.

: "${REVOCATION_PATH:?REFUSE: REVOCATION_PATH not set}"

if [[ ! -f "$REVOCATION_PATH" ]]; then
  echo "REFUSE: revocation file not found"
  exit 1
fi

REVOCATION_ID=$(jq -r '.revocation_id' "$REVOCATION_PATH")
AUTHORITY_SEAL_ID=$(jq -r '.authority_seal_id' "$REVOCATION_PATH")
EFFECTIVE_AT=$(jq -r '.effective_at' "$REVOCATION_PATH")

if [[ -z "$REVOCATION_ID" || "$REVOCATION_ID" == "null" ]]; then
  echo "REFUSE: invalid revocation_id"
  exit 1
fi

if [[ -z "$AUTHORITY_SEAL_ID" || "$AUTHORITY_SEAL_ID" == "null" ]]; then
  echo "REFUSE: invalid authority_seal_id"
  exit 1
fi

if [[ -z "$EFFECTIVE_AT" || "$EFFECTIVE_AT" == "null" ]]; then
  echo "REFUSE: invalid effective_at timestamp"
  exit 1
fi

LEDGER_DIR="ledger/revocations"
mkdir -p "$LEDGER_DIR"

TARGET="$LEDGER_DIR/${REVOCATION_ID}.json"

if [[ -f "$TARGET" ]]; then
  echo "REFUSE: revocation already applied"
  exit 1
fi

cp "$REVOCATION_PATH" "$TARGET"

echo "REVOCATION APPLIED: ${REVOCATION_ID}"
exit 0
