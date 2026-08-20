#!/usr/bin/env bash
# last_verified: 2026-08-20 · kubernetes n/a

# Purpose: Deploy a manifest, wait for the Deployment rollout to reconcile, and
# roll back automatically if it does not become ready in time.
# Usage:   DEPLOYMENT=app NAMESPACE=default MANIFEST=app.yaml TIMEOUT=300s ./deploy-rollout-rollback.sh
# Requires: kubectl with cluster access; MANIFEST must target a Deployment named by DEPLOYMENT.

set -euo pipefail

DEPLOYMENT="${DEPLOYMENT:-}"
NAMESPACE="${NAMESPACE:-default}"
MANIFEST="${MANIFEST:-}"
TIMEOUT="${TIMEOUT:-300s}"

if [ -z "$DEPLOYMENT" ] || [ -z "$MANIFEST" ]; then
  echo "ERROR: DEPLOYMENT and MANIFEST env vars are required." >&2
  echo "Usage: DEPLOYMENT=app NAMESPACE=default MANIFEST=app.yaml $0" >&2
  exit 2
fi

if [ ! -f "$MANIFEST" ]; then
  echo "ERROR: manifest file not found: $MANIFEST" >&2
  exit 2
fi

echo "=== Applying manifest: $MANIFEST ==="
kubectl apply -f "$MANIFEST"

echo "=== Waiting for rollout of deployment/${DEPLOYMENT} (timeout ${TIMEOUT}) ==="
if kubectl rollout status "deployment/${DEPLOYMENT}" -n "${NAMESPACE}" --timeout="${TIMEOUT}"; then
  echo "Rollout complete: deployment/${DEPLOYMENT} is healthy in namespace/${NAMESPACE}."
  kubectl rollout history "deployment/${DEPLOYMENT}" -n "${NAMESPACE}"
  exit 0
fi

echo "Rollout FAILED within ${TIMEOUT}. Rolling back to the prior revision..." >&2
kubectl rollout undo "deployment/${DEPLOYMENT}" -n "${NAMESPACE}"

echo "=== Waiting for rollback to stabilize ==="
if kubectl rollout status "deployment/${DEPLOYMENT}" -n "${NAMESPACE}" --timeout="${TIMEOUT}"; then
  echo "Rollback recovered successfully; deployment/${DEPLOYMENT} is healthy again."
  kubectl rollout history "deployment/${DEPLOYMENT}" -n "${NAMESPACE}"
  exit 0
fi

echo "ERROR: rollback also failed. Manual intervention required." >&2
echo "Inspect with: kubectl rollout history deployment/${DEPLOYMENT} -n ${NAMESPACE}" >&2
exit 1
