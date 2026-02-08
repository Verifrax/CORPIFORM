#!/usr/bin/env bash
set -euo pipefail

# REQUIRE AUCTORISEAL SEAL
# This script enforces the presence of an authority seal issued by AUCTORISEAL.
# Absence or ambiguity results in immediate refusal.

if [[ -z "${AUTHORITY_SEAL_PATH:-}" ]]; then
  echo "REFUSE: AUTHORITY_SEAL_PATH not set"
  exit 1
fi

if [[ ! -f "$AUTHORITY_SEAL_PATH" ]]; then
  echo "REFUSE: authority seal file not found"
  exit 1
fi

if [[ ! -s "$AUTHORITY_SEAL_PATH" ]]; then
  echo "REFUSE: authority seal file is empty"
  exit 1
fi

echo "AUTHORITY SEAL PRESENT"
exit 0
