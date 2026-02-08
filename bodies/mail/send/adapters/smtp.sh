#!/usr/bin/env bash
set -euo pipefail

# SMTP MAIL ADAPTER
# Sends a single email via SMTP. No retries. No mutation.

PARAMS_JSON="${1:-}"

if [[ -z "$PARAMS_JSON" ]]; then
  echo "REFUSE: missing parameters"
  exit 1
fi

TO=$(echo "$PARAMS_JSON" | jq -r '.to')
FROM=$(echo "$PARAMS_JSON" | jq -r '.from')
SUBJECT=$(echo "$PARAMS_JSON" | jq -r '.subject')
BODY=$(echo "$PARAMS_JSON" | jq -r '.body')

if [[ -z "$TO" || -z "$FROM" || -z "$SUBJECT" || -z "$BODY" ]]; then
  echo "REFUSE: incomplete SMTP parameters"
  exit 1
fi

{
  echo "From: ${FROM}"
  echo "To: ${TO}"
  echo "Subject: ${SUBJECT}"
  echo
  echo "${BODY}"
} | sendmail -t

echo "SMTP SEND COMPLETE"
exit 0
