#!/usr/bin/env bash
set -euo pipefail

# VERIFY DENIAL
# Verifies integrity and authenticity of a CORPIFORM denial artifact.

: "${DENIAL_PATH:?REFUSE: DENIAL_PATH not set}"
: "${TRUSTED_PUBLIC_KEY:?REFUSE: TRUSTED_PUBLIC_KEY not set}"

if [[ ! -f "$DENIAL_PATH" ]]; then
  echo "REFUSE: denial file not found"
  exit 1
fi

SIGNATURE=$(jq -r '.signature' "$DENIAL_PATH")

if [[ -z "$SIGNATURE" || "$SIGNATURE" == "null" ]]; then
  echo "REFUSE: missing denial signature"
  exit 1
fi

TMP_UNSIGNED=$(mktemp)
jq 'del(.signature)' "$DENIAL_PATH" > "$TMP_UNSIGNED"

echo "$SIGNATURE" | base64 --decode > "${TMP_UNSIGNED}.sig"

openssl dgst -sha256 -verify "$TRUSTED_PUBLIC_KEY" \
  -signature "${TMP_UNSIGNED}.sig" \
  "$TMP_UNSIGNED" >/dev/null 2>&1

rm -f "$TMP_UNSIGNED" "${TMP_UNSIGNED}.sig"

echo "DENIAL VERIFIED"
exit 0
