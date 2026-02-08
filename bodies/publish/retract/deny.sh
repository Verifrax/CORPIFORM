#!/usr/bin/env bash
set -euo pipefail

# PUBLISH RETRACTION DENIAL
# Explicit denial for any attempted retraction or deletion of published artifacts.

REASON="ARTIFACT_RETRACTION_FORBIDDEN"

echo "REFUSE: ${REASON}"

# Emit denial artifact if configured
if [[ -n "${DENIAL_EMIT_SCRIPT:-}" && -x "${DENIAL_EMIT_SCRIPT:-}" ]]; then
  "${DENIAL_EMIT_SCRIPT}" "${REASON}" || true
fi

exit 1
