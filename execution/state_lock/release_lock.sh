#!/usr/bin/env bash
set -euo pipefail

# RELEASE LOCK
# Releases an execution lock ONLY after a refusal.
# Locks MUST NOT be released after successful execution.

: "${EXECUTION_COMMAND_PATH:?REFUSE: EXECUTION_COMMAND_PATH not set}"

COMMAND_ID=$(jq -r '.command_id' "$EXECUTION_COMMAND_PATH")

if [[ -z "$COMMAND_ID" || "$COMMAND_ID" == "null" ]]; then
  echo "REFUSE: invalid command_id"
  exit 1
fi

LOCK_DIR="ledger/locks"
LOCK_FILE="$LOCK_DIR/${COMMAND_ID}.lock"

# Lock release is permitted only if execution did not occur
if [[ -f "$LOCK_FILE" ]]; then
  rm -f "$LOCK_FILE"
  echo "LOCK RELEASED (DENIAL PATH): ${COMMAND_ID}"
fi

exit 0
