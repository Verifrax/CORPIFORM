#!/usr/bin/env bash
set -euo pipefail

# CORPIFORM CONTAINER ENTRYPOINT
# Ensures runtime invariants before any execution is permitted.

# Ensure execution command and authority are explicitly provided
: "${EXECUTION_COMMAND_PATH:?REFUSE: EXECUTION_COMMAND_PATH not set}"
: "${AUTHORITY_SEAL_PATH:?REFUSE: AUTHORITY_SEAL_PATH not set}"

# Ensure required directories exist
REQUIRED_DIRS=(
  "execution"
  "seals"
  "policy"
  "ledger"
  "bodies"
)

for dir in "${REQUIRED_DIRS[@]}"; do
  if [[ ! -d "$dir" ]]; then
    echo "REFUSE: required directory missing: $dir"
    exit 1
  fi
done

# Delegate to controlled runner
exec runtime/runner/run.sh
