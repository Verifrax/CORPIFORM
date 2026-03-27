#!/usr/bin/env bash
set -euo pipefail

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

CMD_BODY=$(jq -r ".body" "$COMMAND_FILE")
CMD_ACTION=$(jq -r ".action" "$COMMAND_FILE")
CMD_ADAPTER=$(jq -r ".adapter" "$COMMAND_FILE")

for scope_entry in "body:${CMD_BODY}" "action:${CMD_ACTION}" "adapter:${CMD_ADAPTER}"; do
  if ! jq -e --arg entry "$scope_entry" ".scope | index(\$entry) != null" "$SEAL_FILE" >/dev/null; then
    echo "REFUSE: scope mismatch"
    exit 1
  fi
done

echo "AUTHORITY SCOPE VERIFIED"
exit 0
