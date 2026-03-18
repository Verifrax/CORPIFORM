#!/usr/bin/env bash
set -euo pipefail

# EXECUTE ONCE
# Executes the authorized command exactly once. No retries. No fallback.

: "${EXECUTION_COMMAND_PATH:?REFUSE: EXECUTION_COMMAND_PATH not set}"

COMMAND_ID=$(jq -r .command_id "$EXECUTION_COMMAND_PATH")
BODY=$(jq -r .body "$EXECUTION_COMMAND_PATH")
ACTION=$(jq -r .action "$EXECUTION_COMMAND_PATH")
ADAPTER=$(jq -r .adapter "$EXECUTION_COMMAND_PATH")

if [[ -z "$COMMAND_ID" || "$COMMAND_ID" == "null" ]]; then
  echo "REFUSE: invalid command_id"
  exit 1
fi

case "$BODY:$ACTION" in
  mail:MAIL_DISPATCH)
    BODY_EXECUTOR="bodies/mail/send/execute.sh"
    ;;
  payment:PAYMENT_TRANSFER)
    BODY_EXECUTOR="bodies/payment/transfer/execute.sh"
    ;;
  publish:ARTIFACT_PUBLISH)
    BODY_EXECUTOR="bodies/publish/release/execute.sh"
    ;;
  deploy:DEPLOYMENT_PROMOTION)
    BODY_EXECUTOR="bodies/deploy/promote/execute.sh"
    ;;
  *)
    echo "REFUSE: executor mapping not found for body/action"
    exit 1
    ;;
esac

if [[ ! -x "$BODY_EXECUTOR" ]]; then
  echo "REFUSE: executor not found for body/action"
  exit 1
fi

"$BODY_EXECUTOR" "$EXECUTION_COMMAND_PATH"

echo "EXECUTION COMPLETED"
exit 0
