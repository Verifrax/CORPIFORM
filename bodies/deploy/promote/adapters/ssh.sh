#!/usr/bin/env bash
set -euo pipefail

# SSH DEPLOYMENT PROMOTION ADAPTER
# Promotes a deployment via a single SSH command exactly once.
# No retries. No rollback. No mutation beyond the declared command.

PARAMS_JSON="${1:-}"

if [[ -z "$PARAMS_JSON" ]]; then
  echo "REFUSE: missing parameters"
  exit 1
fi

HOST=$(echo "$PARAMS_JSON" | jq -r '.host')
USER=$(echo "$PARAMS_JSON" | jq -r '.user')
SSH_KEY=$(echo "$PARAMS_JSON" | jq -r '.ssh_key')
COMMAND=$(echo "$PARAMS_JSON" | jq -r '.command')

if [[ -z "$HOST" || -z "$USER" || -z "$SSH_KEY" || -z "$COMMAND" ]]; then
  echo "REFUSE: incomplete ssh parameters"
  exit 1
fi

if [[ ! -f "$SSH_KEY" ]]; then
  echo "REFUSE: ssh key not found"
  exit 1
fi

ssh -i "$SSH_KEY" -o IdentitiesOnly=yes -o StrictHostKeyChecking=yes "${USER}@${HOST}" "$COMMAND"

echo "SSH PROMOTION COMPLETE"
exit 0
