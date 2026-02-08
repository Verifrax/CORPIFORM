#!/usr/bin/env bash
set -euo pipefail

# SIGN RECEIPT
# Cryptographically signs a receipt artifact.

: "${RECEIPT_PATH:?REFUSE: RECEIPT_PATH not set}"
: "${RECEIPT_SIGNING_KEY:?REFUSE: RECEIPT_SIGNING_KEY not set}"

if [[ ! -f "$RECEIPT_PATH" ]]; then
  echo "REFUSE: receipt file not found"
  exit 1
fi

SIGNATURE=$(openssl dgst -sha256 -sign "$RECEIPT_SIGNING_KEY" "$RECEIPT_PATH" | base64)

jq --arg sig "$SIGNATURE" '. + {signature: $sig}' "$RECEIPT_PATH" > "${RECEIPT_PATH}.signed"

mv "${RECEIPT_PATH}.signed" "$RECEIPT_PATH"

echo "RECEIPT SIGNED"
exit 0
