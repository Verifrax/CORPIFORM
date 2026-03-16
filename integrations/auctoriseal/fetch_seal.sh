#!/usr/bin/env bash
set -euo pipefail

# FETCH AUTHORITY SEAL
# Retrieves an already-issued authority seal from AUCTORISEAL.
# This script does NOT validate, store, or apply the seal.

: "${AUCTORISEAL_ENDPOINT:?REFUSE: AUCTORISEAL_ENDPOINT not set}"
: "${SEAL_ID:?REFUSE: SEAL_ID not set}"

curl -sSf -X GET "${AUCTORISEAL_ENDPOINT}/seals/${SEAL_ID}" \
  -H "Accept: application/json"

exit 0
