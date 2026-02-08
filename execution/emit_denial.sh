#!/usr/bin/env bash
set -euo pipefail

# EMIT DENIAL
# Emits a signed denial artifact upon any refusal or failure.

REASON="${1:-UNSPECIFIED_DENIAL}"

: "${EXECUTION_COMMAND_PATH:?REFUSE: EXECUTION_COMMAND_PATH not set}"
: "${SYSTEM_FINGERPRINT:?REFUSE: SYSTEM_FINGERPRINT not set}"
: "${BUILD_HASH:?REFUSE: BUILD_HASH not set}"
: "${CORPIFORM_VERSION:?REFUSE: CORPIFORM_VERSION not set}"
: "${DENIAL_SIGNING_KEY:?REFUSE: DENIAL_SIGNING_KEY not set}"

DENIAL_ID=$(uuidgen)
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

COMMAND_ID=$(jq -r '.command_id' "$EXECUTION_COMMAND_PATH")
BODY=$(jq -r '.body' "$EXECUTION_COMMAND_PATH")
ACTION=$(jq -r '.action' "$EXECUTION_COMMAND_PATH")
ADAPTER=$(jq -r '.adapter' "$EXECUTION_COMMAND_PATH")
AUTHORITY_SEAL_ID=$(jq -r '.authority_seal_id // empty' "$EXECUTION_COMMAND_PATH")

TMP_DENIAL=$(mktemp)

cat > "$TMP_DENIAL" <<EOF
{
  "denial_id": "$DENIAL_ID",
  "system": "CORPIFORM",
  "system_fingerprint": "$SYSTEM_FINGERPRINT",
  "build_hash": "$BUILD_HASH",
  "version": "$CORPIFORM_VERSION",
  "command_id": "$COMMAND_ID",
  "authority_seal_id": "$AUTHORITY_SEAL_ID",
  "body": "$BODY",
  "action": "$ACTION",
  "adapter": "$ADAPTER",
  "timestamp": "$TIMESTAMP",
  "reason": "$REASON"
}
EOF

SIGNATURE=$(openssl dgst -sha256 -sign "$DENIAL_SIGNING_KEY" "$TMP_DENIAL" | base64)

jq --arg sig "$SIGNATURE" '. + {signature: $sig}' "$TMP_DENIAL" > "${TMP_DENIAL}.signed"

LEDGER_DIR="ledger/denials"
mkdir -p "$LEDGER_DIR"
mv "${TMP_DENIAL}.signed" "$LEDGER_DIR/$DENIAL_ID.json"

rm -f "$TMP_DENIAL"

echo "DENIAL EMITTED: $DENIAL_ID"
exit 0
