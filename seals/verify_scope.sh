#!/usr/bin/env bash
set -euo pipefail

# VERIFY AUTHORITY SCOPE
# Ensures the authority seal scope matches the execution command scope exactly.

SEAL_FILE="${AUTHORITY_SEAL_PATH:-}"
COMMAND_FILE="${EXECUTION_COMMAND_PATH:-}"

if [[ -z "$SEAL_FILE" || -z "$COMMAND_FILE" ]]; then
  echo "REFUSE: missing seal or command path"
  exit 1
fi

if [[ ! -f "$SEAL_FILE" || ! -f "$COMMAND_FILE" ]]; then
  echo "REFUSE: seal or command file not found"
  exit 1
fi

SEAL_BODY=$(jq -r ".scope.body" "$SEAL_FILE")
SEAL_ACTION=$(jq -r ".scope.action" "$SEAL_FILE")
SEAL_ADAPTER=$(jq -r ".scope.adapter" "$SEAL_FILE")

CMD_BODY=$(jq -r ".body" "$COMMAND_FILE")
CMD_ACTION=$(jq -r ".action" "$COMMAND_FILE")
CMD_ADAPTER=$(jq -r ".adapter" "$COMMAND_FILE")

if [[ -z "$SEAL_BODY" || "$SEAL_BODY" == "null" ]]; then
  echo "REFUSE: missing scope body"
  exit 1
fi

if [[ -z "$SEAL_ACTION" || "$SEAL_ACTION" == "null" ]]; then
  echo "REFUSE: missing scope action"
  exit 1
fi

if [[ -z "$SEAL_ADAPTER" || "$SEAL_ADAPTER" == "null" ]]; then
  echo "REFUSE: missing scope adapter"
  exit 1
fi

if [[ "$SEAL_BODY" != "$CMD_BODY" ]]; then
  echo "REFUSE: scope body mismatch"
  exit 1
fi

if [[ "$SEAL_ACTION" != "$CMD_ACTION" ]]; then
  echo "REFUSE: scope action mismatch"
  exit 1
fi

if [[ "$SEAL_ADAPTER" != "$CMD_ADAPTER" ]]; then
  echo "REFUSE: scope adapter mismatch"
  exit 1
fi

echo "AUTHORITY SCOPE VERIFIED"
exit 0
