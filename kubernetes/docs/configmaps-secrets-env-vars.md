---
last_verified: 2026-07-30
tool_version: 1.29
sources:
  - https://clankercloud.ai/blog/iac-kubernetes-practical-patterns-2026
  - https://markaicode.com/integrate/kubernetes-with-docker/
---

# Wiring ConfigMaps, Secrets, and env vars into a multi-tier K8s app

## Purpose

Reference doc on how to inject configuration and sensitive data into Kubernetes workloads using ConfigMaps, Secrets, and environment variables across a multi-tier application. Covers the patterns a DevOps engineer needs to wire these resources into a Deployment so that the web tier receives its configuration without hardcoding values into container images.

## When to use

Use ConfigMaps for non-sensitive configuration data such as feature flags, log levels, and upstream endpoints. Use Secrets for credentials, tokens, and TLS material. Reference both from Deployments via `env` blocks or mounted volume files.

A multi-tier application typically has a web tier that reads configuration from ConfigMaps and secrets from Secrets, while backend services may need different values for the same keys depending on the environment. This pattern keeps configuration out of container images and out of git history, making it possible to swap tiers between environments without rebuilding.

## Steps

### 1. Create a ConfigMap

Define application-level configuration as a ConfigMap. Values in ConfigMaps are exposed as environment variables or mounted files inside pods.

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: app-config
data:
  LOG_LEVEL: "info"
  UPSTREAM_HOST: "api.internal"
```

### 2. Create a Secret

Define sensitive data as a Secret. Use `kubectl create secret generic` with `--from-literal` rather than manually base64-encoding values; the CLI handles encoding automatically.

```bash
kubectl create secret generic app-secrets \
  --from-literal=DB_PASSWORD='s3cret' \
  --from-literal=API_KEY='abc123'
```

### 3. Wire both into a Deployment

Reference the ConfigMap and Secret from the Deployment spec. Environment variables take precedence over volume-mounted files when both target the same key, so choose one mechanism per key to avoid confusion.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web-app
spec:
  replicas: 2
  selector:
    matchLabels:
      app: web
  template:
    metadata:
      labels:
        app: web
    spec:
      containers:
      - name: web
        image: web-app:1.0.0
        env:
        - name: LOG_LEVEL
          valueFrom:
            configMapKeyRef:
              name: app-config
              key: LOG_LEVEL
        - name: DB_PASSWORD
          valueFrom:
            secretKeyRef:
              name: app-secrets
              key: DB_PASSWORD
        volumeMounts:
        - name: config-volume
          mountPath: /etc/app/config
          readOnly: true
      volumes:
      - name: config-volume
        configMap:
          name: app-config
```

### 4. Apply the resources in order

Apply the ConfigMap and Secret before the Deployment so that the pod scheduler can resolve references at creation time.

```bash
kubectl apply -f app-configmap.yaml
kubectl apply -f app-secrets.yaml
kubectl apply -f app-deployment.yaml
```

## Verify

Confirm the deployment rolls out with healthy replicas and that the environment variables are populated inside the container. Use `kubectl describe pod` to surface any events related to missing ConfigMap or Secret references.

```bash
kubectl rollout status deployment/web-app
kubectl exec -it <pod-name> -- env | grep -E 'LOG_LEVEL|DB_PASSWORD'
```

## References

- [IAC Kubernetes practical patterns](https://clankercloud.ai/blog/iac-kubernetes-practical-patterns-2026).
- [Integrate Kubernetes with Docker](https://markaicode.com/integrate/kubernetes-with-docker/).