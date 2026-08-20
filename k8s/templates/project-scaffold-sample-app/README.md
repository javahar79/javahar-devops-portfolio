---
last_verified: 2026-08-19
tool_version: n/a
sources: []
---

# Project scaffold: sample app with ConfigMap, Secret, Service, and Ingress

## Purpose

This scaffold gives you a minimal Kubernetes project layout for a sample web application. It includes a Namespace, ConfigMap, Secret, Deployment, Service, and Ingress so you can deploy and expose a stateless workload in a single apply sequence. The manifest set is small on purpose — copy it into a fresh project and extend it, rather than treating it as a production baseline.

## Steps

1. Copy the scaffold into your working directory:
   ```bash
   cp -r k8s/templates/project-scaffold-sample-app/* .
   ```

2. Edit `secret.yaml` and replace the placeholder base64 values. Generate new ones with:
   ```bash
   echo -n 'your-value' | base64
   ```

3. Apply the manifests in dependency order:
   ```bash
   kubectl apply -f namespace.yaml
   kubectl apply -f configmap.yaml
   kubectl apply -f secret.yaml
   kubectl apply -f deployment.yaml
   kubectl apply -f service.yaml
   kubectl apply -f ingress.yaml
   ```

4. Watch the rollout:
   ```bash
   kubectl rollout status deployment/sample-app -n sample-app
   ```

## Verify

- `kubectl get ns` lists `sample-app`.
- `kubectl get pods -n sample-app` shows the `sample-app` pod as `Running` and `Ready`.
- `kubectl get svc,ingress -n sample-app` shows the ClusterIP service and the Ingress resource with an address or host rule populated.
