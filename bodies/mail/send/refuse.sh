#!/usr/bin/env bash
set -euo pipefail

# MAIL SEND REFUSAL
# Terminal refusal handler for outbound mail execution.

REASON="${1:-MAIL_SEND_REFUSED}"

echo "REFUSE: ${REASON}"

# Emit denial artifact if configured
if [[ -n "${DENIAL_EMIT_SCRIPT:-}" && -x "${DENIAL_EMIT_SCRIPT:-}" ]]; then
  "${DENIAL_EMIT_SCRIPT}" "${REASON}" || true
fi

exit 1
