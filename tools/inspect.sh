#!/usr/bin/env bash
set -euo pipefail

# INSPECT
# Non-invasive system inspection tool.
# Reads state only. Performs no mutation. Executes nothing.

echo "CORPIFORM INSPECTION"
echo "-------------------"

# System status
if [[ -f STATUS.md ]]; then
  echo "STATUS:"
  cat STATUS.md
else
  echo "STATUS: MISSING"
fi

# Identity
echo
echo "IDENTITY:"
if [[ -f id/SYSTEM_IDENTITY.md ]]; then
  sed 's/^/  /' id/SYSTEM_IDENTITY.md
else
  echo "  SYSTEM_IDENTITY: MISSING"
fi

if [[ -f id/BUILD_HASH.txt ]]; then
  echo "  BUILD_HASH: $(cat id/BUILD_HASH.txt)"
else
  echo "  BUILD_HASH: MISSING"
fi

# Ledger summary
echo
echo "LEDGER SUMMARY:"
for dir in receipts denials revocations locks checkpoints; do
  count=$(find "ledger/${dir}" -type f 2>/dev/null | wc -l | tr -d ' ')
  echo "  ${dir}: ${count}"
done

# Bodies available
echo
echo "BODIES:"
if [[ -d bodies ]]; then
  find bodies -maxdepth 1 -mindepth 1 -type d -printf "  - %f\n"
else
  echo "  bodies directory missing"
fi

# Final note
echo
echo "INSPECTION COMPLETE"
exit 0
