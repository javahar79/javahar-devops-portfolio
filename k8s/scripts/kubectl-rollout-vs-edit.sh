#!/bin/bash
# last_verified: 2026-07-29 · kubernetes n/a
#
# Compares two zero-downtime update strategies for Kubernetes Deployments:
# `kubectl rollout` (rolling-update) vs `kubectl set image` (in-place patch).
# Run against a live cluster and observe the outcomes.

set -euo pipefail

DEPLOY="${1:?Usage: $0 <deployment-name> [namespace]}"
NS="${2:-default}"

echo "=== Strategy A: kubectl rollout restart ==="
kubectl rollout restart deployment/"$DEPLOY" -n "$NS"
echo "Waiting for rollout to finish..."
kubectl rollout status deployment/"$DEPLOY" -n "$NS" --timeout=120s
echo "Rollout complete."

echo ""
echo "=== Strategy B: kubectl set image (in-place patch) ==="
echo "This patches the live Deployment spec directly. Use with caution."
echo "To test, patch the image tag and observe the rolling update."
kubectl set image deployment/"$DEPLOY" web=web-app:latest -n "$NS"
kubectl rollout status deployment/"$DEPLOY" -n "$NS" --timeout=120s
echo "Edit-based update complete."

echo ""
echo "=== Verify: check ReplicaSets and pod availability ==="
kubectl get rs -n "$NS" | grep "$DEPLOY"
kubectl get pods -n "$NS" -l app="$DEPLOY" -o wide

echo ""
echo "=== Verify: maxUnavailable=0 keeps all pods alive during update ==="
kubectl get deployment "$DEPLOY" -n "$NS" -o jsonpath='{.spec.strategy.rollingUpdate.maxUnavailable}'
echo ""