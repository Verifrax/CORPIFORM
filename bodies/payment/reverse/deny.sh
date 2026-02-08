#!/usr/bin/env bash
set -euo pipefail

# PAYMENT REVERSAL DENIAL
# Explicit denial for any attempted payment reversal.
# CORPIFORM does not perform reversals.

REASON="PAYMENT_REVERSAL_FORBIDDEN"

echo "REFUSE: ${REASON}"

# Emit denial artifact if configured
if [[ -n "${DENIAL_EMIT_SCRIPT:-}" && -x "${DENIAL_EMIT_SCRIPT:-}" ]]; then
  "${DENIAL_EMIT_SCRIPT}" "${REASON}" || true
fi

exit 1
