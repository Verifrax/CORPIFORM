#!/usr/bin/env bash
set -euo pipefail

# MAIL RECEIVE EXTRACT
# Extracts structured data from inbound email exactly once.
# No mutation. No forwarding. No storage beyond emitted artifact.

: "${EXECUTION_COMMAND_PATH:?REFUSE: EXECUTION_COMMAND_PATH not set}"

PARAMS_JSON=$(jq -c '.parameters' "$EXECUTION_COMMAND_PATH")

RAW_MESSAGE=$(echo "$PARAMS_JSON" | jq -r '.raw_message')

if [[ -z "$RAW_MESSAGE" || "$RAW_MESSAGE" == "null" ]]; then
  echo "REFUSE: missing raw_message"
  exit 1
fi

EXTRACTED=$(echo "$RAW_MESSAGE" | sed -n '/^$/,$p')

if [[ -z "$EXTRACTED" ]]; then
  echo "REFUSE: extraction failed"
  exit 1
fi

echo "MAIL EXTRACTION COMPLETE"
exit 0
