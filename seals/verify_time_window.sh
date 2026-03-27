#!/usr/bin/env bash
set -euo pipefail

SEAL_FILE="${AUTHORITY_SEAL_PATH:-}"

if [[ -z "$SEAL_FILE" ]]; then
  echo "REFUSE: no authority seal path provided"
  exit 1
fi

if [[ ! -f "$SEAL_FILE" ]]; then
  echo "REFUSE: authority seal file not found"
  exit 1
fi

ISSUED_AT=$(jq -r ".issued_at" "$SEAL_FILE")
EXPIRES_AT=$(jq -r ".expires_at" "$SEAL_FILE")

if [[ -z "$ISSUED_AT" || "$ISSUED_AT" == "null" ]]; then
  echo "REFUSE: missing issued_at"
  exit 1
fi

python3 - "$ISSUED_AT" "$EXPIRES_AT" <<'PY'
import sys, time

issued_at = int(sys.argv[1])
expires_raw = sys.argv[2]
expires_at = None if expires_raw == "null" else int(expires_raw)
now_ms = int(time.time() * 1000)

if now_ms < issued_at:
    print("REFUSE: authority not yet valid")
    raise SystemExit(1)

if expires_at is not None and now_ms > expires_at:
    print("REFUSE: authority expired")
    raise SystemExit(1)

print("AUTHORITY TIME WINDOW VERIFIED")
PY

exit 0
