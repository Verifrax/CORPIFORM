#!/usr/bin/env bash
set -euo pipefail

# REFUSE ON RETRY
# Hard refusal if an execution retry is detected.

COMMAND_ID="${1:-}"

if [[ -z "$COMMAND_ID" ]]; then
  echo "REFUSE: retry detected with missing command_id"
  exit 1
fi

echo "REFUSE: retry attempt detected for command_id=${COMMAND_ID}"

# Emit denial artifact if configured
if [[ -n "${DENIAL_EMIT_SCRIPT:-}" && -x "${DENIAL_EMIT_SCRIPT:-}" ]]; then
  "${DENIAL_EMIT_SCRIPT}" "RETRY_ATTEMPT_DETECTED" || true
fi

exit 1
