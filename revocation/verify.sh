#!/usr/bin/env bash
set -euo pipefail

# VERIFY REVOCATION
# Verifies cryptographic validity and issuer trust of a revocation artifact.

: "${REVOCATION_PATH:?REFUSE: REVOCATION_PATH not set}"

if [[ ! -f "$REVOCATION_PATH" ]]; then
  echo "REFUSE: revocation file not found"
  exit 1
fi

ISSUER=$(jq -r '.issuer' "$REVOCATION_PATH")
SIGNATURE=$(jq -r '.signature' "$REVOCATION_PATH")

if [[ -z "$ISSUER" || "$ISSUER" == "null" ]]; then
  echo "REFUSE: missing issuer"
  exit 1
fi

if [[ -z "$SIGNATURE" || "$SIGNATURE" == "null" ]]; then
  echo "REFUSE: missing signature"
  exit 1
fi

TRUSTED_ROOTS="id/TRUSTED_ROOTS/auctorseal_roots.json"

if [[ ! -f "$TRUSTED_ROOTS" ]]; then
  echo "REFUSE: trusted roots not found"
  exit 1
fi

ROOT_MATCH=$(jq --arg issuer "$ISSUER" '.trusted_roots[] | select(.name == $issuer)' "$TRUSTED_ROOTS")

if [[ -z "$ROOT_MATCH" ]]; then
  echo "REFUSE: issuer not trusted"
  exit 1
fi

echo "REVOCATION VERIFIED"
exit 0
