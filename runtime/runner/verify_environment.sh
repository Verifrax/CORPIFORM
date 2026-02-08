#!/usr/bin/env bash
set -euo pipefail

# VERIFY ENVIRONMENT
# Ensures runtime invariants are satisfied before execution can begin.

REQUIRED_BINARIES=(bash jq openssl curl date uuidgen)

for bin in "${REQUIRED_BINARIES[@]}"; do
  if ! command -v "$bin" >/dev/null 2>&1; then
    echo "REFUSE: missing required binary: $bin"
    exit 1
  fi
done

REQUIRED_PATHS=(
  "STATUS.md"
  "CONTRACT.md"
  "SCOPE.md"
  "AUTHORITY.md"
  "FAILURE.md"
  "DEATH.md"
  "VERSION.md"
  "policy/allowed_actions.yml"
  "policy/forbidden_actions.yml"
  "id/SYSTEM_IDENTITY.md"
  "id/BUILD_HASH.txt"
  "id/fingerprints/corpiform.fingerprint"
  "id/TRUSTED_ROOTS/auctorseal_roots.json"
)

for p in "${REQUIRED_PATHS[@]}"; do
  if [[ ! -e "$p" ]]; then
    echo "REFUSE: missing required path: $p"
    exit 1
  fi
done

# Ledger structure
mkdir -p ledger/receipts ledger/denials ledger/revocations ledger/locks ledger/checkpoints

echo "RUNTIME ENVIRONMENT VERIFIED"
exit 0
