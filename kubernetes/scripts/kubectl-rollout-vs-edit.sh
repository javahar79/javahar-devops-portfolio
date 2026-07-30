#!/usr/bin/env bash
# last_verified: 2026-07-30 · kubernetes n/a
# Purpose: Compare kubectl rollout vs kubectl edit as zero-downtime update strategies.
# Usage: Set DEPLOYMENT, NAMESPACE, and NEW_IMAGE env vars to target values, then run.
# Requires: kubectl configured with access to a cluster and a Deployment named by DEPLOYMENT.

set -euo pipefail

DEPLOYMENT="${DEPLOYMENT:-my-app}"
NAMESPACE="${NAMESPACE:-default}"
NEW_IMAGE="${NEW_IMAGE:-my-app:v2}"

echo "=== Kubernetes zero-downtime update strategy comparison ==="
echo "Deployment: ${DEPLOYMENT}"
echo "Namespace:  ${NAMESPACE}"
echo "New image:  ${NEW_IMAGE}"
echo ""

echo "--- Strategy 1: kubectl rollout ---"
echo "Restarts all pods with the current configuration. No spec change, no new image."
echo "Use this when you need to force a restart (e.g., configmap/s secret change)."
kubectl rollout restart deployment/"${DEPLOYMENT}" -n "${NAMESPACE}"
kubectl rollout status deployment/"${DEPLOYMENT}" -n "${NAMESPACE}" --timeout=120s
echo "Rollout restart completed."
echo ""

echo "--- Strategy 2: kubectl edit (via patch) ---"
echo "Edits the deployment spec, which triggers a RollingUpdate with the new configuration."
echo "kubectl edit opens an interactive editor; the non-interactive equivalent below"
echo "applies the same change via kubectl patch, which has the same effect."
kubectl patch deployment/"${DEPLOYMENT}" -n "${NAMESPACE}" \
  --type='json' -p="[{\"op\":\"replace\",\"path\":\"/spec/template/spec/containers/0/image\",\"value\":\"${NEW_IMAGE}\"}]"
kubectl rollout status deployment/"${DEPLOYMENT}" -n "${NAMESPACE}" --timeout=120s
echo "Edit-based rollout completed."
echo ""

echo "=== Comparison ==="
echo "Both strategies trigger a RollingUpdate. The key differences:"
echo "  - rollout restart restarts pods with unchanged configuration (useful after configmap/secret updates)."
echo "  - edit/patch changes a deployment spec field, triggering a RollingUpdate with the new spec."
echo "  - For true zero-downtime, ensure maxUnavailable=0 and a working readiness probe."
echo ""

echo "=== Verification ==="
echo "Rollout history for ${DEPLOYMENT}:"
kubectl rollout history deployment/"${DEPLOYMENT}" -n "${NAMESPACE}"