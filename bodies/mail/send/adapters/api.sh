#!/usr/bin/env bash
set -euo pipefail

# API MAIL ADAPTER
# Sends a single email via external email API. No retries. No mutation.

PARAMS_JSON="${1:-}"

if [[ -z "$PARAMS_JSON" ]]; then
  echo "REFUSE: missing parameters"
  exit 1
fi

API_ENDPOINT=$(echo "$PARAMS_JSON" | jq -r '.endpoint')
API_KEY=$(echo "$PARAMS_JSON" | jq -r '.api_key')
TO=$(echo "$PARAMS_JSON" | jq -r '.to')
FROM=$(echo "$PARAMS_JSON" | jq -r '.from')
SUBJECT=$(echo "$PARAMS_JSON" | jq -r '.subject')
BODY=$(echo "$PARAMS_JSON" | jq -r '.body')

if [[ -z "$API_ENDPOINT" || -z "$API_KEY" || -z "$TO" || -z "$FROM" || -z "$SUBJECT" || -z "$BODY" ]]; then
  echo "REFUSE: incomplete API parameters"
  exit 1
fi

curl -sSf -X POST "$API_ENDPOINT" \
  -H "Authorization: Bearer ${API_KEY}" \
  -H "Content-Type: application/json" \
  -d "{
    \"to\": \"${TO}\",
    \"from\": \"${FROM}\",
    \"subject\": \"${SUBJECT}\",
    \"body\": \"${BODY}\"
  }"

echo "API SEND COMPLETE"
exit 0
