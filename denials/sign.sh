#!/usr/bin/env bash
set -euo pipefail

# SIGN DENIAL
# Cryptographically signs a denial artifact.

: "${DENIAL_PATH:?REFUSE: DENIAL_PATH not set}"
: "${DENIAL_SIGNING_KEY:?REFUSE: DENIAL_SIGNING_KEY not set}"

if [[ ! -f "$DENIAL_PATH" ]]; then
  echo "REFUSE: denial file not found"
  exit 1
fi

SIGNATURE=$(openssl dgst -sha256 -sign "$DENIAL_SIGNING_KEY" "$DENIAL_PATH" | base64)

jq --arg sig "$SIGNATURE" '. + {signature: $sig}' "$DENIAL_PATH" > "${DENIAL_PATH}.signed"

mv "${DENIAL_PATH}.signed" "$DENIAL_PATH"

echo "DENIAL SIGNED"
exit 0
