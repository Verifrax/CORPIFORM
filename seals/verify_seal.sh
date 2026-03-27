#!/usr/bin/env bash
set -euo pipefail

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

ISSUER=$(jq -r ".issued_by" "$SEAL_FILE")
SEAL_ID=$(jq -r ".seal_id" "$SEAL_FILE")
STATUS=$(jq -r ".status" "$SEAL_FILE")

if [[ -z "$ISSUER" || "$ISSUER" == "null" ]]; then
  echo "REFUSE: missing issued_by"
  exit 1
fi

if [[ -z "$SEAL_ID" || "$SEAL_ID" == "null" ]]; then
  echo "REFUSE: missing seal_id"
  exit 1
fi

if [[ "$STATUS" != "active" ]]; then
  echo "REFUSE: authority seal not active"
  exit 1
fi

TRUSTED_ROOTS="id/TRUSTED_ROOTS/auctoriseal_roots.json"

if [[ ! -f "$TRUSTED_ROOTS" ]]; then
  echo "REFUSE: trusted roots not found"
  exit 1
fi

ROOT_MATCH=$(jq --arg issuer "$ISSUER" ".trusted_roots[] | select(.name == \$issuer and .status == \"ACTIVE\")" "$TRUSTED_ROOTS")

if [[ -z "$ROOT_MATCH" ]]; then
  echo "REFUSE: issuer not trusted"
  exit 1
fi

echo "AUTHORITY SEAL VERIFIED"
exit 0
