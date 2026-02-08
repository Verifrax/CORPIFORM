#!/usr/bin/env bash
set -euo pipefail

# EXECUTE ONCE
# Executes the authorized command exactly once. No retries. No fallback.

: "${EXECUTION_COMMAND_PATH:?REFUSE: EXECUTION_COMMAND_PATH not set}"

COMMAND_ID=$(jq -r '.command_id' "$EXECUTION_COMMAND_PATH")
BODY=$(jq -r '.body' "$EXECUTION_COMMAND_PATH")
ACTION=$(jq -r '.action' "$EXECUTION_COMMAND_PATH")
ADAPTER=$(jq -r '.adapter' "$EXECUTION_COMMAND_PATH")

if [[ -z "$COMMAND_ID" || "$COMMAND_ID" == "null" ]]; then
  echo "REFUSE: invalid command_id"
  exit 1
fi

# Execute body-specific adapter
BODY_EXECUTOR="bodies/${BODY}/${ACTION,,}/execute.sh"

if [[ ! -x "$BODY_EXECUTOR" ]]; then
  echo "REFUSE: executor not found for body/action"
  exit 1
fi

"$BODY_EXECUTOR" "$EXECUTION_COMMAND_PATH"

echo "EXECUTION COMPLETED"
exit 0
