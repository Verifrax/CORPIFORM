#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

set -a
source ci/determinism.expected
set +a

sha256_file() {
  if command -v sha256sum >/dev/null 2>&1; then
    sha256sum "$1" | awk "{print \$1}"
  else
    shasum -a 256 "$1" | awk "{print \$1}"
  fi
}

sha256_text() {
  if command -v sha256sum >/dev/null 2>&1; then
    printf "%s" "$1" | sha256sum | awk "{print \$1}"
  else
    printf "%s" "$1" | shasum -a 256 | awk "{print \$1}"
  fi
}

must_equal() {
  local name="$1"
  local actual="$2"
  local expected="$3"
  if [ "$actual" != "$expected" ]; then
    printf "%s: expected=%s actual=%s\n" "$name" "$expected" "$actual" >&2
    exit 1
  fi
}

HELP_OUTPUT="$("$PWD/bin/corpiform" help)"
HELP_SHA="$(sha256_text "$HELP_OUTPUT")"
RECEIPT_SHA="$(sha256_file receipts/format.json)"
DENIAL_SHA="$(sha256_file denials/format.json)"
AUTHORITY_SHA="$(sha256_file interfaces/authority.input.schema.json)"
EXECUTION_SHA="$(sha256_file interfaces/execution.command.schema.json)"
REVOCATION_SHA="$(sha256_file interfaces/revocation.input.schema.json)"

must_equal HELP_STDOUT_SHA256 "$HELP_SHA" "$HELP_STDOUT_SHA256"
must_equal RECEIPT_SCHEMA_SHA256 "$RECEIPT_SHA" "$RECEIPT_SCHEMA_SHA256"
must_equal DENIAL_SCHEMA_SHA256 "$DENIAL_SHA" "$DENIAL_SCHEMA_SHA256"
must_equal AUTHORITY_SCHEMA_SHA256 "$AUTHORITY_SHA" "$AUTHORITY_SCHEMA_SHA256"
must_equal EXECUTION_COMMAND_SCHEMA_SHA256 "$EXECUTION_SHA" "$EXECUTION_COMMAND_SCHEMA_SHA256"
must_equal REVOCATION_SCHEMA_SHA256 "$REVOCATION_SHA" "$REVOCATION_SCHEMA_SHA256"

printf "determinism: verified\n"
