#!/usr/bin/env bash
set -euo pipefail

# EMIT RECEIPT (WRAPPER)
# Canonical wrapper to emit a signed execution receipt and persist it to the ledger.

: "${EXECUTION_COMMAND_PATH:?REFUSE: EXECUTION_COMMAND_PATH not set}"
: "${AUTHORITY_SEAL_PATH:?REFUSE: AUTHORITY_SEAL_PATH not set}"
: "${SYSTEM_FINGERPRINT:?REFUSE: SYSTEM_FINGERPRINT not set}"
: "${BUILD_HASH:?REFUSE: BUILD_HASH not set}"
: "${CORPIFORM_VERSION:?REFUSE: CORPIFORM_VERSION not set}"
: "${RECEIPT_SIGNING_KEY:?REFUSE: RECEIPT_SIGNING_KEY not set}"

# Delegate to execution-layer receipt emitter
execution/emit_receipt.sh

echo "RECEIPT EMISSION COMPLETE"
exit 0
