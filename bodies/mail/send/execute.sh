#!/usr/bin/env bash
set -euo pipefail

# MAIL SEND EXECUTION
# Sends a single outbound email exactly once via a declared adapter.

: "${EXECUTION_COMMAND_PATH:?REFUSE: EXECUTION_COMMAND_PATH not set}"

ADAPTER=$(jq -r '.adapter' "$EXECUTION_COMMAND_PATH")
PARAMS=$(jq -c '.parameters' "$EXECUTION_COMMAND_PATH")

case "$ADAPTER" in
  smtp)
    bodies/mail/send/adapters/smtp.sh "$PARAMS"
    ;;
  api)
    bodies/mail/send/adapters/api.sh "$PARAMS"
    ;;
  *)
    echo "REFUSE: unsupported mail adapter"
    exit 1
    ;;
esac

exit 0
