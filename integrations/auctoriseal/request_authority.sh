#!/usr/bin/env bash
set -euo pipefail

# REQUEST AUTHORITY
# Non-executing helper to request an authority seal from AUCTORISEAL.
# This script does NOT grant authority and does NOT execute anything.

: "${AUCTORISEAL_ENDPOINT:?REFUSE: AUCTORISEAL_ENDPOINT not set}"
: "${AUTHORITY_REQUEST_PAYLOAD:?REFUSE: AUTHORITY_REQUEST_PAYLOAD not set}"

curl -sSf -X POST "$AUCTORISEAL_ENDPOINT" \
  -H "Content-Type: application/json" \
  -d @"$AUTHORITY_REQUEST_PAYLOAD"

exit 0
