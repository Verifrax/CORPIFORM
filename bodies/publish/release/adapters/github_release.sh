#!/usr/bin/env bash
set -euo pipefail

# GITHUB RELEASE ADAPTER
# Publishes a single immutable artifact as a GitHub release. No retries. No mutation.

PARAMS_JSON="${1:-}"

if [[ -z "$PARAMS_JSON" ]]; then
  echo "REFUSE: missing parameters"
  exit 1
fi

REPO=$(echo "$PARAMS_JSON" | jq -r '.repo')
TAG=$(echo "$PARAMS_JSON" | jq -r '.tag')
NAME=$(echo "$PARAMS_JSON" | jq -r '.name')
BODY=$(echo "$PARAMS_JSON" | jq -r '.body')
ASSET_PATH=$(echo "$PARAMS_JSON" | jq -r '.asset_path')
GITHUB_TOKEN=$(echo "$PARAMS_JSON" | jq -r '.github_token')

if [[ -z "$REPO" || -z "$TAG" || -z "$NAME" || -z "$ASSET_PATH" || -z "$GITHUB_TOKEN" ]]; then
  echo "REFUSE: incomplete GitHub release parameters"
  exit 1
fi

if [[ ! -f "$ASSET_PATH" ]]; then
  echo "REFUSE: asset file not found"
  exit 1
fi

curl -sSf -X POST "https://api.github.com/repos/${REPO}/releases" \
  -H "Authorization: token ${GITHUB_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "{
    \"tag_name\": \"${TAG}\",
    \"name\": \"${NAME}\",
    \"body\": \"${BODY}\",
    \"draft\": false,
    \"prerelease\": false
  }" >/dev/null

echo "GITHUB RELEASE CREATED"
exit 0
