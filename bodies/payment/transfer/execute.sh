#!/usr/bin/env bash
set -euo pipefail

# PAYMENT TRANSFER EXECUTION
# Transfers funds exactly once via a declared payment adapter.

: "${EXECUTION_COMMAND_PATH:?REFUSE: EXECUTION_COMMAND_PATH not set}"

ADAPTER=$(jq -r '.adapter' "$EXECUTION_COMMAND_PATH")
PARAMS=$(jq -c '.parameters' "$EXECUTION_COMMAND_PATH")

case "$ADAPTER" in
  stripe)
    bodies/payment/transfer/adapters/stripe.sh "$PARAMS"
    ;;
  bank)
    bodies/payment/transfer/adapters/bank.sh "$PARAMS"
    ;;
  *)
    echo "REFUSE: unsupported payment adapter"
    exit 1
    ;;
esac

exit 0
