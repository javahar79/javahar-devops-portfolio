# last_verified: 2026-07-21 · Kubernetes (kubectl n/a)

# I collected these kubectl debugging commands while troubleshooting
# my first real deployment. Each one solved a different "why isn't this working" moment.

# 1) pod logs — always the first place I look when a pod isn't behaving
kubectl logs deployment/my-app --tail=50
kubectl logs deployment/my-app --previous
# --previous shows logs from the crashed container — super helpful

# 2) exec into a running container when logs aren't enough
kubectl exec -it deployment/my-app -- sh
kubectl exec deployment/my-app -- env | grep DATABASE_URL
# I use --it for interactive sessions and plain exec for one-off checks

# 3) port-forward to reach a service from my local machine
kubectl port-forward service/my-app 8080:80
# Then curl http://localhost:8080 — saved me when the ingress wasn't configured yet

# 4) describe — the events at the bottom always have the real error
kubectl describe pod my-app-7d8f9c4b6c-x2kqh
kubectl describe deployment my-app
