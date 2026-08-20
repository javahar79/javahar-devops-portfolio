#!/usr/bin/env bash
# last_verified: 2026-08-20 · kubernetes n/a
# Reusable kubectl helper: apply a manifest, watch rollout status, and rollback on failure.
# Supports Deployments and StatefulSets.
# Usage: ./deploy-rollout-status-rollback.sh <manifest-file> [namespace]
# Example: ./deploy-rollout-status-rollback.sh deployment.yaml default

set -euo pipefail

MANIFEST="${1:?Usage: $0 <manifest-file> [namespace]}"
NAMESPACE="${2:-default}"

apply_manifest() {
  echo "Applying manifest: ${MANIFEST}"
  kubectl apply -f "${MANIFEST}"
}

get_resource() {
  kubectl get -f "${MANIFEST}" \
    -o custom-columns='KIND:{kind},NAME:{metadata.name}' --no-headers 2>/dev/null \
    | head -1
}

rollback() {
  local resource="$1"
  echo "Rollout failed. Rolling back ${resource} to previous revision..."
  kubectl rollout undo "${resource}" -n "${NAMESPACE}"
  kubectl rollout status "${resource}" -n "${NAMESPACE}" --timeout=120s
  echo "Rollback completed."
}

apply_manifest

read -r KIND NAME <<< "$(get_resource | tr ',' ' ')"
RESOURCE="${KIND,,}/${NAME}"

case "${KIND}" in
  Deployment|StatefulSet)
    echo "Watching rollout status for ${RESOURCE} in namespace ${NAMESPACE}..."
    if ! kubectl rollout status "${RESOURCE}" -n "${NAMESPACE}" --timeout=120s; then
      rollback "${RESOURCE}"
      exit 1
    fi
    echo "${RESOURCE} rolled out successfully."
    ;;
  *)
    echo "Resource kind ${KIND} does not support rollout status. Apply completed."
    ;;
esac
