#!/usr/bin/env bash
set -euo pipefail

# ARTIFACT PUBLISH EXECUTION
# Publishes a single immutable artifact exactly once via a declared adapter.

: "${EXECUTION_COMMAND_PATH:?REFUSE: EXECUTION_COMMAND_PATH not set}"

ADAPTER=$(jq -r '.adapter' "$EXECUTION_COMMAND_PATH")
PARAMS=$(jq -c '.parameters' "$EXECUTION_COMMAND_PATH")

case "$ADAPTER" in
  github_release)
    bodies/publish/release/adapters/github_release.sh "$PARAMS"
    ;;
  registry)
    bodies/publish/release/adapters/registry.sh "$PARAMS"
    ;;
  *)
    echo "REFUSE: unsupported publish adapter"
    exit 1
    ;;
esac

exit 0
