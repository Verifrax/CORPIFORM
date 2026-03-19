#!/usr/bin/env bash
set -euo pipefail

# EMIT RECEIPT
# Emits a signed execution receipt after successful execution.

: "${EXECUTION_COMMAND_PATH:?REFUSE: EXECUTION_COMMAND_PATH not set}"
: "${AUTHORITY_SEAL_PATH:?REFUSE: AUTHORITY_SEAL_PATH not set}"
: "${SYSTEM_FINGERPRINT:?REFUSE: SYSTEM_FINGERPRINT not set}"
: "${BUILD_HASH:?REFUSE: BUILD_HASH not set}"
: "${CORPIFORM_VERSION:?REFUSE: CORPIFORM_VERSION not set}"
: "${RECEIPT_SIGNING_KEY:?REFUSE: RECEIPT_SIGNING_KEY not set}"

RECEIPT_ID=$(uuidgen)
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

COMMAND_ID=$(jq -r '.command_id' "$EXECUTION_COMMAND_PATH")
BODY=$(jq -r '.body' "$EXECUTION_COMMAND_PATH")
ACTION=$(jq -r '.action' "$EXECUTION_COMMAND_PATH")
ADAPTER=$(jq -r '.adapter' "$EXECUTION_COMMAND_PATH")
AUTHORITY_SEAL_ID=$(jq -r '.seal_id' "$AUTHORITY_SEAL_PATH")

TMP_RECEIPT=$(mktemp)

cat > "$TMP_RECEIPT" <<EOF
{
  "receipt_id": "$RECEIPT_ID",
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
  "outcome": "EXECUTED"
}
EOF

SIGNATURE=$(openssl dgst -sha256 -sign "$RECEIPT_SIGNING_KEY" "$TMP_RECEIPT" | base64)

jq --arg sig "$SIGNATURE" '. + {signature: $sig}' "$TMP_RECEIPT" > "${TMP_RECEIPT}.signed"

LEDGER_DIR="ledger/receipts"
mkdir -p "$LEDGER_DIR"
mv "${TMP_RECEIPT}.signed" "$LEDGER_DIR/$RECEIPT_ID.json"

rm -f "$TMP_RECEIPT"

echo "RECEIPT EMITTED: $RECEIPT_ID"
exit 0
