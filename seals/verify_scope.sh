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

SEAL_RESOURCES=$(jq -r '.scope.resources[]' "$SEAL_FILE" | sort)
CMD_RESOURCES=$(jq -r '.parameters.resources[]?' "$COMMAND_FILE" | sort)

if [[ -z "$SEAL_RESOURCES" ]]; then
  echo "REFUSE: empty authority scope"
  exit 1
fi

if [[ "$SEAL_RESOURCES" != "$CMD_RESOURCES" ]]; then
  echo "REFUSE: scope mismatch"
  exit 1
fi

echo "AUTHORITY SCOPE VERIFIED"
exit 0
