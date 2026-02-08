#!/usr/bin/env bash
set -euo pipefail

# VERIFY RECEIPT (VERIFRAX)
# Verifies a CORPIFORM receipt independently using VERIFRAX tooling.
# This script does NOT influence CORPIFORM execution.

: "${RECEIPT_PATH:?REFUSE: RECEIPT_PATH not set}"
: "${TRUSTED_PUBLIC_KEY:?REFUSE: TRUSTED_PUBLIC_KEY not set}"

if [[ ! -f "$RECEIPT_PATH" ]]; then
  echo "REFUSE: receipt file not found"
  exit 1
fi

SIGNATURE=$(jq -r '.signature' "$RECEIPT_PATH")
if [[ -z "$SIGNATURE" || "$SIGNATURE" == "null" ]]; then
  echo "INVALID: receipt missing signature"
  exit 1
fi

TMP_UNSIGNED=$(mktemp)
jq 'del(.signature)' "$RECEIPT_PATH" > "$TMP_UNSIGNED"

echo "$SIGNATURE" | base64 --decode > "${TMP_UNSIGNED}.sig"

openssl dgst -sha256 -verify "$TRUSTED_PUBLIC_KEY" \
  -signature "${TMP_UNSIGNED}.sig" \
  "$TMP_UNSIGNED" >/dev/null 2>&1

rm -f "$TMP_UNSIGNED" "${TMP_UNSIGNED}.sig"

echo "VERIFIED: receipt cryptographically valid"
exit 0
