#!/usr/bin/env bash
set -euo pipefail

# DEPLOYMENT ROLLBACK DENIAL
# Explicit denial for any attempted rollback.
# CORPIFORM does not perform rollbacks.

REASON="DEPLOYMENT_ROLLBACK_FORBIDDEN"

echo "REFUSE: ${REASON}"

# Emit denial artifact if configured
if [[ -n "${DENIAL_EMIT_SCRIPT:-}" && -x "${DENIAL_EMIT_SCRIPT:-}" ]]; then
  "${DENIAL_EMIT_SCRIPT}" "${REASON}" || true
fi

exit 1
