#!/usr/bin/env bash
set -euo pipefail

# VERIFY REVOCATION
# Refuses execution if authority seal is revoked.

SEAL_FILE="${AUTHORITY_SEAL_PATH:-}"

if [[ -z "$SEAL_FILE" ]]; then
  echo "REFUSE: no authority seal path provided"
  exit 1
fi

if [[ ! -f "$SEAL_FILE" ]]; then
  echo "REFUSE: authority seal file not found"
  exit 1
fi

REVOKED=$(jq -r ".revoked // false" "$SEAL_FILE")

if [[ "$REVOKED" == "true" ]]; then
  echo "REFUSE: authority revoked"
  exit 1
fi

echo "AUTHORITY NOT REVOKED"
exit 0
