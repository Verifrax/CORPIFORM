#!/usr/bin/env bash
set -euo pipefail

# VERIFY AUTHORITY TIME WINDOW
# Ensures current time is within the authority seal validity window.

SEAL_FILE="${AUTHORITY_SEAL_PATH:-}"

if [[ -z "$SEAL_FILE" ]]; then
  echo "REFUSE: no authority seal path provided"
  exit 1
fi

if [[ ! -f "$SEAL_FILE" ]]; then
  echo "REFUSE: authority seal file not found"
  exit 1
fi

VALID_FROM=$(jq -r '.time_window.valid_from' "$SEAL_FILE")
VALID_UNTIL=$(jq -r '.time_window.valid_until' "$SEAL_FILE")

if [[ -z "$VALID_FROM" || -z "$VALID_UNTIL" || "$VALID_FROM" == "null" || "$VALID_UNTIL" == "null" ]]; then
  echo "REFUSE: invalid time window in authority seal"
  exit 1
fi

NOW_UTC=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

FROM_EPOCH=$(date -u -d "$VALID_FROM" +"%s")
UNTIL_EPOCH=$(date -u -d "$VALID_UNTIL" +"%s")
NOW_EPOCH=$(date -u -d "$NOW_UTC" +"%s")

if (( NOW_EPOCH < FROM_EPOCH )); then
  echo "REFUSE: authority not yet valid"
  exit 1
fi

if (( NOW_EPOCH > UNTIL_EPOCH )); then
  echo "REFUSE: authority expired"
  exit 1
fi

echo "AUTHORITY TIME WINDOW VERIFIED"
exit 0
