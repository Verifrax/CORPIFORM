#!/usr/bin/env bash
set -euo pipefail

# REGISTRY PUBLISH ADAPTER
# Publishes a single immutable artifact to a declared registry endpoint. No retries. No mutation.

PARAMS_JSON="${1:-}"

if [[ -z "$PARAMS_JSON" ]]; then
  echo "REFUSE: missing parameters"
  exit 1
fi

ENDPOINT=$(echo "$PARAMS_JSON" | jq -r '.endpoint')
TOKEN=$(echo "$PARAMS_JSON" | jq -r '.token')
ARTIFACT_PATH=$(echo "$PARAMS_JSON" | jq -r '.artifact_path')
ARTIFACT_HASH=$(echo "$PARAMS_JSON" | jq -r '.artifact_hash')

if [[ -z "$ENDPOINT" || -z "$TOKEN" || -z "$ARTIFACT_PATH" || -z "$ARTIFACT_HASH" ]]; then
  echo "REFUSE: incomplete registry parameters"
  exit 1
fi

if [[ ! -f "$ARTIFACT_PATH" ]]; then
  echo "REFUSE: artifact file not found"
  exit 1
fi

curl -sSf -X POST "$ENDPOINT" \
  -H "Authorization: Bearer ${TOKEN}" \
  -H "X-Artifact-Hash: ${ARTIFACT_HASH}" \
  -F "file=@${ARTIFACT_PATH}" >/dev/null

echo "REGISTRY PUBLISH COMPLETE"
exit 0
