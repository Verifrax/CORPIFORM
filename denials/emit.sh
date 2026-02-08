#!/usr/bin/env bash
set -euo pipefail

# EMIT DENIAL (WRAPPER)
# Canonical wrapper to emit a signed denial artifact and persist it to the ledger.

REASON="${1:-UNSPECIFIED_DENIAL}"

: "${EXECUTION_COMMAND_PATH:?REFUSE: EXECUTION_COMMAND_PATH not set}"
: "${SYSTEM_FINGERPRINT:?REFUSE: SYSTEM_FINGERPRINT not set}"
: "${BUILD_HASH:?REFUSE: BUILD_HASH not set}"
: "${CORPIFORM_VERSION:?REFUSE: CORPIFORM_VERSION not set}"
: "${DENIAL_SIGNING_KEY:?REFUSE: DENIAL_SIGNING_KEY not set}"

execution/emit_denial.sh "$REASON"

echo "DENIAL EMISSION COMPLETE"
exit 0
