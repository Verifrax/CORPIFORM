#!/usr/bin/env bash
set -euo pipefail

# STRIPE PAYMENT ADAPTER
# Executes a single outbound payment via Stripe. No retries. No mutation.

PARAMS_JSON="${1:-}"

if [[ -z "$PARAMS_JSON" ]]; then
  echo "REFUSE: missing parameters"
  exit 1
fi

API_KEY=$(echo "$PARAMS_JSON" | jq -r '.api_key')
AMOUNT=$(echo "$PARAMS_JSON" | jq -r '.amount')
CURRENCY=$(echo "$PARAMS_JSON" | jq -r '.currency')
DESTINATION=$(echo "$PARAMS_JSON" | jq -r '.destination')

if [[ -z "$API_KEY" || -z "$AMOUNT" || -z "$CURRENCY" || -z "$DESTINATION" ]]; then
  echo "REFUSE: incomplete Stripe parameters"
  exit 1
fi

curl -sSf https://api.stripe.com/v1/transfers \
  -u "${API_KEY}:" \
  -d amount="${AMOUNT}" \
  -d currency="${CURRENCY}" \
  -d destination="${DESTINATION}" >/dev/null

echo "STRIPE TRANSFER COMPLETE"
exit 0
