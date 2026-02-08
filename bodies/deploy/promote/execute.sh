#!/usr/bin/env bash
set -euo pipefail

# DEPLOYMENT PROMOTION EXECUTION
# Promotes a deployment exactly once via a declared adapter.

: "${EXECUTION_COMMAND_PATH:?REFUSE: EXECUTION_COMMAND_PATH not set}"

ADAPTER=$(jq -r '.adapter' "$EXECUTION_COMMAND_PATH")
PARAMS=$(jq -c '.parameters' "$EXECUTION_COMMAND_PATH")

case "$ADAPTER" in
  k8s)
    bodies/deploy/promote/adapters/k8s.sh "$PARAMS"
    ;;
  ssh)
    bodies/deploy/promote/adapters/ssh.sh "$PARAMS"
    ;;
  *)
    echo "REFUSE: unsupported deploy adapter"
    exit 1
    ;;
esac

exit 0
