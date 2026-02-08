#!/usr/bin/env bash
set -euo pipefail

# ARTIFACT PUBLISH REFUSAL
# Terminal refusal handler for artifact publication.

REASON="${1:-ARTIFACT_PUBLISH_REFUSED}"

echo "REFUSE: ${REASON}"

# Emit denial artifact if configured
if [[ -n "${DENIAL_EMIT_SCRIPT:-}" && -x "${DENIAL_EMIT_SCRIPT:-}" ]]; then
  "${DENIAL_EMIT_SCRIPT}" "${REASON}" || true
fi

exit 1
