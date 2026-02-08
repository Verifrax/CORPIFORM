#!/usr/bin/env bash
set -euo pipefail

# REJECT INVALID AUTHORITY
# Terminal refusal handler for any invalid, ambiguous, or failed authority check.

REASON="${1:-UNSPECIFIED_INVALID_AUTHORITY}"

echo "REFUSE: $REASON"

# Emit denial artifact if execution context exists
if [[ -n "${DENIAL_EMIT_SCRIPT:-}" && -x "${DENIAL_EMIT_SCRIPT:-}" ]]; then
  "${DENIAL_EMIT_SCRIPT}" "$REASON" || true
fi

# Ensure no execution proceeds
exit 1
