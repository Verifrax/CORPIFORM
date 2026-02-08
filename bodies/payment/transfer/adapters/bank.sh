#!/usr/bin/env bash
set -euo pipefail

# BANK PAYMENT ADAPTER
# Executes a single outbound bank transfer via a declared bank API endpoint.
# No retries. No mutation.

PARAMS_JSON="${1:-}"

if [[ -z "$PARAMS_JSON" ]]; then
  echo "REFUSE: missing parameters"
  exit 1
fi

ENDPOINT=$(echo "$PARAMS_JSON" | jq -r '.endpoint')
TOKEN=$(echo "$PARAMS_JSON" | jq -r '.token')
AMOUNT=$(echo "$PARAMS_JSON" | jq -r '.amount')
CURRENCY=$(echo "$PARAMS_JSON" | jq -r '.currency')
RECIPIENT=$(echo "$PARAMS_JSON" | jq -r '.recipient')

if [[ -z "$ENDPOINT" || -z "$TOKEN" || -z "$AMOUNT" || -z "$CURRENCY" || -z "$RECIPIENT" ]]; then
  echo "REFUSE: incomplete bank parameters"
  exit 1
fi

curl -sSf -X POST "$ENDPOINT" \
  -H "Authorization: Bearer ${TOKEN}" \
  -H "Content-Type: application/json" \
  -d "{
    \"amount\": \"${AMOUNT}\",
    \"currency\": \"${CURRENCY}\",
    \"recipient\": \"${RECIPIENT}\"
  }" >/dev/null

echo "BANK TRANSFER COMPLETE"
exit 0
