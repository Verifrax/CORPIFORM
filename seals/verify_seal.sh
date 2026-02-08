#!/usr/bin/env bash
set -euo pipefail

# VERIFY AUTHORITY SEAL
# Verifies cryptographic validity and issuer trust of the authority seal.

SEAL_FILE="${AUTHORITY_SEAL_PATH:-}"

if [[ -z "$SEAL_FILE" ]]; then
  echo "REFUSE: no authority seal path provided"
  exit 1
fi

if [[ ! -f "$SEAL_FILE" ]]; then
  echo "REFUSE: authority seal file not found"
  exit 1
fi

if [[ ! -s "$SEAL_FILE" ]]; then
  echo "REFUSE: authority seal file is empty"
  exit 1
fi

ISSUER=$(jq -r '.issuer' "$SEAL_FILE")
SIGNATURE=$(jq -r '.signature' "$SEAL_FILE")

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

echo "AUTHORITY SEAL VERIFIED"
exit 0
