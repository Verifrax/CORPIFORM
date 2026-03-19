#!/usr/bin/env bash
set -euo pipefail

# VERIFY AUTHORITY TIME WINDOW
# Ensures current time is within the authority seal validity window.

SEAL_FILE="${AUTHORITY_SEAL_PATH:-}"

if [[ -z "$SEAL_FILE" ]]; then
  echo "REFUSE: no authority seal path provided"
  exit 1
fi

if [[ ! -f "$SEAL_FILE" ]]; then
  echo "REFUSE: authority seal file not found"
  exit 1
fi

VALID_FROM=$(jq -r ".valid_from" "$SEAL_FILE")
VALID_UNTIL=$(jq -r ".valid_until" "$SEAL_FILE")

if [[ -z "$VALID_FROM" || "$VALID_FROM" == "null" || -z "$VALID_UNTIL" || "$VALID_UNTIL" == "null" ]]; then
  echo "REFUSE: invalid time window in authority seal"
  exit 1
fi

python3 - "$VALID_FROM" "$VALID_UNTIL" <<'PY'
import sys
from datetime import datetime, timezone

valid_from = sys.argv[1]
valid_until = sys.argv[2]

def parse_iso_z(value: str) -> datetime:
    return datetime.strptime(value, "%Y-%m-%dT%H:%M:%SZ").replace(tzinfo=timezone.utc)

now = datetime.now(timezone.utc)
from_dt = parse_iso_z(valid_from)
until_dt = parse_iso_z(valid_until)

if now < from_dt:
    print("REFUSE: authority not yet valid")
    raise SystemExit(1)

if now > until_dt:
    print("REFUSE: authority expired")
    raise SystemExit(1)

print("AUTHORITY TIME WINDOW VERIFIED")
PY

exit 0
