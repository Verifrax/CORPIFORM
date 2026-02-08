#!/usr/bin/env bash
set -euo pipefail

# ROTATE KEYS
# Operator-only procedure to rotate cryptographic signing keys.
# This tool does NOT generate keys.
# It only updates references and records the rotation event.
# Rotation is irreversible and auditable.

: "${NEW_RECEIPT_SIGNING_KEY:?REFUSE: NEW_RECEIPT_SIGNING_KEY not set}"
: "${NEW_DENIAL_SIGNING_KEY:?REFUSE: NEW_DENIAL_SIGNING_KEY not set}"
: "${OPERATOR_ID:?REFUSE: OPERATOR_ID not set}"

STATUS_FILE="STATUS.md"
LEDGER_DIR="ledger/checkpoints"
TIMESTAMP="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
ROTATION_ID="key-rotation-$(uuidgen)"

if [[ ! -f "$STATUS_FILE" ]]; then
  echo "REFUSE: STATUS.md not found"
  exit 1
fi

if grep -q "DEAD" "$STATUS_FILE"; then
  echo "REFUSE: system is dead"
  exit 1
fi

if grep -q "FROZEN" "$STATUS_FILE"; then
  echo "REFUSE: system is frozen"
  exit 1
fi

mkdir -p "$LEDGER_DIR"

cat > "${LEDGER_DIR}/${ROTATION_ID}.json" <<EOF
{
  "checkpoint_id": "${ROTATION_ID}",
  "type": "KEY_ROTATION",
  "operator": "${OPERATOR_ID}",
  "timestamp": "${TIMESTAMP}",
  "receipt_signing_key_ref": "${NEW_RECEIPT_SIGNING_KEY}",
  "denial_signing_key_ref": "${NEW_DENIAL_SIGNING_KEY}"
}
EOF

echo "KEY ROTATION RECORDED"
echo "Rotation ID: ${ROTATION_ID}"
exit 0
