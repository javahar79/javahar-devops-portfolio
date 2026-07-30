---
last_verified: 2026-07-30
tool_version: "≥1.24"
sources:
  - https://clankercloud.ai/blog/iac-kubernetes-practical-patterns-2026
  - https://markaicode.com/integrate/kubernetes-with-docker/
---

# Wiring ConfigMaps, Secrets, and env vars into a multi-tier K8s app

## Purpose

This doc covers how to inject configuration and sensitive data into a Kubernetes Deployment using ConfigMaps, Secrets, and environment variables across a multi-tier application. One way to do this is to define a ConfigMap for non-sensitive settings and a Secret for credentials, then wire both into the pod spec via `env` blocks or volume mounts — the docs also suggest volume mounting for larger configuration payloads.

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

Reference the ConfigMap and Secret from the Deployment spec. Environment variables take precedence over volume-mounted files when both target the same key, so it is best to choose one mechanism per key to avoid confusion.

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

Apply the ConfigMap and Secret before the Deployment so that the pod scheduler can resolve references at creation time. If a reference cannot be resolved at scheduling time, the pod will fail to start — it is worth verifying that both resources exist first.

```bash
kubectl apply -f app-configmap.yaml
kubectl apply -f app-secrets.yaml
kubectl apply -f app-deployment.yaml
```

## Verify

Confirm the deployment rolls out with healthy replicas and that the environment variables are populated inside the container. Use `kubectl describe pod` to surface any events related to missing ConfigMap or Secret references — if something is missing, the events will show a `MissingConfigMap` or `MissingSecret` reason.

```bash
kubectl rollout status deployment/web-app
kubectl exec -it <pod-name> -- env | grep -E 'LOG_LEVEL|DB_PASSWORD'
```