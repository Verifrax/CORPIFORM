#!/usr/bin/env bash
set -euo pipefail

# DEPLOYMENT PROMOTION REFUSAL
# Terminal refusal handler for deployment promotion.

REASON="${1:-DEPLOYMENT_PROMOTION_REFUSED}"

echo "REFUSE: ${REASON}"

# Emit denial artifact if configured
if [[ -n "${DENIAL_EMIT_SCRIPT:-}" && -x "${DENIAL_EMIT_SCRIPT:-}" ]]; then
  "${DENIAL_EMIT_SCRIPT}" "${REASON}" || true
fi

exit 1
