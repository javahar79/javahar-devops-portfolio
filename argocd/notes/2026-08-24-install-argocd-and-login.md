---
last_verified: 2026-08-24
tool_version: v3.5.1
sources:
  - https://argo-cd.readthedocs.io/en/stable/getting_started/
  - https://dev.to/ptp2308/argocd-install-kubernetes-cluster-aws-common-mistakes-and-how-to-avoid-them-20e0
  - https://devopsaitoolkit.com/blog/gitops-with-argo-cd-a-practical-starting-guide/
---

# Install ArgoCD and log in

> L1 notes: installing ArgoCD from the pinned release manifest and logging in with the admin account.

## What I did

I followed the official getting-started guide but pinned to a specific version (`v3.5.1`) instead of using `stable`. The first thing I hit was the CRD annotation size limit — client-side `kubectl apply` embeds the full schema in `last-applied-configuration` and the ApplicationSet CRD exceeds 262KB. The fix is to use `--server-side --force-conflicts` on the first install.

```bash
kubectl create namespace argocd
kubectl apply -n argocd --server-side --force-conflicts -f https://raw.githubusercontent.com/argoproj/argo-cd/<version>/manifests/install.yaml
```

## Getting the admin password

The default admin password is the pod name of `argocd-server`. Retrieve it with:

```bash
argocd admin initial-password -n argocd
```

It returns something like `abc123`. Delete the secret after first login — it stores the password in cleartext:

```bash
kubectl delete secret argocd-initial-admin-secret -n argocd
```

## Port-forwarding to the UI

ArgoCD isn't exposed outside the cluster by default. I used port-forwarding:

```bash
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

Then opened the UI in the browser, logged in as `admin` with the password from above.

## CLI login

For the CLI, I exported the port-forward namespace so every command uses it automatically:

```bash
export ARGOCD_OPTS='--port-forward-namespace argocd'
argocd login localhost:8080
```

## What I'll cover next

Now that I have ArgoCD running, I want to connect it to a Git repo and deploy an Application. I'll also explore how to add a second cluster and set up RBAC for team access.