# last_verified: 2026-07-21 · Kubernetes (kubectl n/a)

# I wrote this to have a repeatable process for debugging deployments
# instead of randomly running kubectl commands and hoping something sticks.
# Usage: bash 2026-07-21-troubleshoot-failing-deployment.sh <deployment-name> [namespace]

DEPLOY="${1:?Usage: $0 <deployment-name> [namespace]}"
NS="${2:-default}"

echo "=== Step 1: Deployment status ==="
kubectl get deployment "$DEPLOY" -n "$NS" -o wide

echo ""
echo "=== Step 2: ReplicaSet and Pod count ==="
kubectl get rs -n "$NS" | grep "$DEPLOY" || echo "  (no ReplicaSets found)"
kubectl get pods -n "$NS" | grep "$DEPLOY" || echo "  (no pods found)"

echo ""
echo "=== Step 3: Describe the Deployment ==="
kubectl describe deployment "$DEPLOY" -n "$NS" | tail -30

echo ""
echo "=== Step 4: Pod logs ==="
PODS=$(kubectl get pods -n "$NS" --selector=app="$DEPLOY" -o name 2>/dev/null | head -3)
if [ -z "$PODS" ]; then
  PODS=$(kubectl get pods -n "$NS" | grep "$DEPLOY" | awk '{print $1}' | head -3)
fi
if [ -n "$PODS" ]; then
  for POD in $PODS; do
    echo "--- $POD ---"
    kubectl logs "$POD" -n "$NS" --tail=20 2>/dev/null || echo "  (no logs yet)"
  done
fi

echo ""
echo "=== Step 5: Related Events ==="
kubectl get events -n "$NS" --sort-by='.lastTimestamp' | grep "$DEPLOY" | tail -10
