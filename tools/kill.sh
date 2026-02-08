#!/usr/bin/env bash
set -euo pipefail

# KILL
# Permanently terminates CORPIFORM.
# Death is irreversible. No execution may ever resume.

STATUS_FILE="STATUS.md"

if [[ ! -f "$STATUS_FILE" ]]; then
  echo "REFUSE: STATUS.md not found"
  exit 1
fi

echo "DEAD" > "$STATUS_FILE"

echo "SYSTEM TERMINATED"
echo "No execution is permitted. No recovery exists."
exit 0
