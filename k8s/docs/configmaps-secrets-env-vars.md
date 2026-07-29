---
last_verified: 2026-07-29
tool_version: n/a
sources:
  - https://clankercloud.ai/blog/iac-kubernetes-practical-patterns-2026
  - https://learnwithneeraj.com/ai-gen-ai/production-grade-deployment-kubernetes-terraform-scaling
---

# Wiring ConfigMaps, Secrets, and env vars into a multi-tier K8s app

## Purpose

Reference doc on how to inject configuration and sensitive data into Kubernetes workloads using ConfigMaps, Secrets, and environment variables across a multi-tier application.

## When to use

Use ConfigMaps for non-sensitive configuration data (feature flags, log levels, upstream endpoints). Use Secrets for credentials, tokens, and TLS material. Reference both from Deployments via `env` blocks or mounted volume files.

## Prerequisites

- A running Kubernetes cluster (any recent version)
- `kubectl` configured with cluster access
- A namespace prepared for the application

## Steps

1. Create a ConfigMap with application configuration.

   ```yaml
   apiVersion: v1
   kind: ConfigMap
   metadata:
     name: app-config
   data:
     LOG_LEVEL: "info"
     UPSTREAM_HOST: "api.internal"
   ```

2. Create a Secret with sensitive data. Use a base64-encoded value or create it from a literal string.

   ```yaml
   apiVersion: v1
   kind: Secret
   metadata:
     name: app-secrets
   type: Opaque
   data:
     DB_PASSWORD: cGFzc3dvcmQ=
   ```

3. Wire both into a Deployment via environment variables and a volume mount.

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
           image: web-app:latest
           env:
           - name: LOG_LEVEL
             valueFrom:
               configMapKeyRef:
                 name: app-config
                 key: LOG_LEVEL
           - name: UPSTREAM_HOST
             valueFrom:
               configMapKeyRef:
                 name: app-config
                 key: UPSTREAM_HOST
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

4. Apply the resources in order.

   ```bash
   kubectl apply -f app-configmap.yaml
   kubectl apply -f app-secrets.yaml
   kubectl apply -f app-deployment.yaml
   ```

5. Verify the pod picks up the values. Exec into a container and inspect the env vars and mounted files.

   ```bash
   kubectl exec -it <pod-name> -- env | grep -E 'LOG_LEVEL|UPSTREAM_HOST|DB_PASSWORD'
   kubectl exec -it <pod-name> -- cat /etc/app/config/LOG_LEVEL
   ```

## Verify

Confirm the deployment rolls out with healthy replicas and the environment variables are populated inside the container. Check `kubectl describe pod` for any events related to missing ConfigMap or Secret references.

## Common errors

- Referencing a ConfigMap or Secret that does not exist causes the pod to fail to schedule — create both resources before deploying the workload.
- Base64-encoding a Secret value manually is a common source of subtle bugs; use `kubectl create secret generic` with `--from-literal` instead.
- Mounting a ConfigMap as a volume and also referencing the same key via `env` creates two independent copies — changes to the ConfigMap require a pod restart to take effect in the env var.

## References

- [External Secrets Operator — standard solution for injecting secrets into Kubernetes](https://clankercloud.ai/blog/iac-kubernetes-practical-patterns-2026).
- [`maxUnavailable: 0` rolling update strategy for zero-downtime deployments](https://learnwithneeraj.com/ai-gen-ai/production-grade-deployment-kubernetes-terraform-scaling).