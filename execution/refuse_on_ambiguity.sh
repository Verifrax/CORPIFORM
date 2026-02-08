#!/usr/bin/env bash
set -euo pipefail

# REFUSE ON AMBIGUITY
# Terminal refusal when any ambiguity is detected in inputs, authority, or state.

REASON="${1:-AMBIGUOUS_EXECUTION_STATE}"

echo "REFUSE: $REASON"

# Emit denial artifact if configured
if [[ -n "${DENIAL_EMIT_SCRIPT:-}" && -x "${DENIAL_EMIT_SCRIPT:-}" ]]; then
  "${DENIAL_EMIT_SCRIPT}" "$REASON" || true
fi

exit 1
