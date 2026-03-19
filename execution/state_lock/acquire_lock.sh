#!/usr/bin/env bash
set -euo pipefail

# ACQUIRE LOCK
# Enforces execute-once semantics by creating an immutable lock per command_id.

: "${EXECUTION_COMMAND_PATH:?REFUSE: EXECUTION_COMMAND_PATH not set}"

COMMAND_ID=$(jq -r '.command_id' "$EXECUTION_COMMAND_PATH")

if [[ -z "$COMMAND_ID" || "$COMMAND_ID" == "null" ]]; then
  echo "REFUSE: invalid command_id"
  exit 1
fi

LOCK_DIR="ledger/locks"
LOCK_FILE="$LOCK_DIR/${COMMAND_ID}.lock"

mkdir -p "$LOCK_DIR"

if [[ -f "$LOCK_FILE" ]]; then
  execution/refuse_on_retry.sh "$COMMAND_ID"
  exit 1
fi

{
  echo "command_id=${COMMAND_ID}"
  echo "acquired_at=$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
} > "$LOCK_FILE"

echo "LOCK ACQUIRED: ${COMMAND_ID}"
exit 0
