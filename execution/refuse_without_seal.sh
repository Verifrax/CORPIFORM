#!/usr/bin/env bash
set -euo pipefail

# REFUSE WITHOUT SEAL
# Hard refusal path when no authority seal is present.

echo "REFUSE: no authority seal provided"

# Emit denial artifact if configured
if [[ -n "${DENIAL_EMIT_SCRIPT:-}" && -x "${DENIAL_EMIT_SCRIPT:-}" ]]; then
  "${DENIAL_EMIT_SCRIPT}" "MISSING_AUTHORITY_SEAL" || true
fi

exit 1
