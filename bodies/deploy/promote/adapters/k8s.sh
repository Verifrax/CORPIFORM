#!/usr/bin/env bash
set -euo pipefail

# K8S DEPLOYMENT PROMOTION ADAPTER
# Promotes a deployment to a Kubernetes cluster exactly once.
# No retries. No rollback. No mutation.

PARAMS_JSON="${1:-}"

if [[ -z "$PARAMS_JSON" ]]; then
  echo "REFUSE: missing parameters"
  exit 1
fi

KUBECONFIG_PATH=$(echo "$PARAMS_JSON" | jq -r '.kubeconfig')
NAMESPACE=$(echo "$PARAMS_JSON" | jq -r '.namespace')
DEPLOYMENT=$(echo "$PARAMS_JSON" | jq -r '.deployment')
IMAGE=$(echo "$PARAMS_JSON" | jq -r '.image')

if [[ -z "$KUBECONFIG_PATH" || -z "$NAMESPACE" || -z "$DEPLOYMENT" || -z "$IMAGE" ]]; then
  echo "REFUSE: incomplete k8s parameters"
  exit 1
fi

if [[ ! -f "$KUBECONFIG_PATH" ]]; then
  echo "REFUSE: kubeconfig not found"
  exit 1
fi

export KUBECONFIG="$KUBECONFIG_PATH"

kubectl -n "$NAMESPACE" set image "deployment/${DEPLOYMENT}" "*=${IMAGE}"

echo "K8S DEPLOYMENT PROMOTED"
exit 0
