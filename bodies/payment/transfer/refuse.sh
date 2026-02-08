#!/usr/bin/env bash
set -euo pipefail

# PAYMENT TRANSFER REFUSAL
# Terminal refusal handler for payment execution.

REASON="${1:-PAYMENT_TRANSFER_REFUSED}"

echo "REFUSE: ${REASON}"

# Emit denial artifact if configured
if [[ -n "${DENIAL_EMIT_SCRIPT:-}" && -x "${DENIAL_EMIT_SCRIPT:-}" ]]; then
  "${DENIAL_EMIT_SCRIPT}" "${REASON}" || true
fi

exit 1
