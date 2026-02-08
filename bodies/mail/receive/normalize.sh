#!/usr/bin/env bash
set -euo pipefail

# MAIL NORMALIZE
# Normalizes extracted inbound email data into a canonical JSON structure.
# No inference. No scoring. No classification.

: "${EXECUTION_COMMAND_PATH:?REFUSE: EXECUTION_COMMAND_PATH not set}"

PARAMS_JSON=$(jq -c '.parameters' "$EXECUTION_COMMAND_PATH")

RAW_MESSAGE=$(echo "$PARAMS_JSON" | jq -r '.raw_message')

if [[ -z "$RAW_MESSAGE" || "$RAW_MESSAGE" == "null" ]]; then
  echo "REFUSE: missing raw_message"
  exit 1
fi

FROM=$(echo "$RAW_MESSAGE" | awk -F': ' '/^From:/{print $2; exit}')
TO=$(echo "$RAW_MESSAGE" | awk -F': ' '/^To:/{print $2; exit}')
SUBJECT=$(echo "$RAW_MESSAGE" | awk -F': ' '/^Subject:/{print $2; exit}')

BODY=$(echo "$RAW_MESSAGE" | sed -n '/^$/,$p' | sed '1d')

jq -n \
  --arg from "${FROM:-}" \
  --arg to "${TO:-}" \
  --arg subject "${SUBJECT:-}" \
  --arg body "${BODY:-}" \
  '{
    from: $from,
    to: $to,
    subject: $subject,
    body: $body
  }'

exit 0
