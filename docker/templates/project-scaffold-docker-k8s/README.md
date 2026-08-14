---
last_verified: 2026-08-14
tool_version: n/a
sources: []
---

# Project scaffold: Docker + Kubernetes multi-service application

## Purpose

This scaffold is a starting point for a small multi-service application (a web tier backed by a database and a cache) that runs the same code two ways: with Docker Compose for local development, and on Kubernetes for a cluster deployment. The compose file and the Kubernetes manifests describe the same services, so it doubles as a reference for mapping Compose concepts onto their Kubernetes equivalents.

## Steps

1. Copy the scaffold into your project root:

   ```bash
   cp -R docker/templates/project-scaffold-docker-k8s/* .
   ```

2. Run locally with Compose:

   ```bash
   docker compose up --build -d
   docker compose ps
   ```

   The web service is on `localhost:8080`.

3. Deploy to Kubernetes, applying the manifests in order:

   ```bash
   kubectl apply -f kubernetes/configmap.yaml
   kubectl apply -f kubernetes/db-secret.yaml
   kubectl apply -f kubernetes/db-service.yaml
   kubectl apply -f kubernetes/db-statefulset.yaml
   kubectl apply -f kubernetes/cache-service.yaml
   kubectl apply -f kubernetes/cache-deployment.yaml
   kubectl apply -f kubernetes/deployment.yaml
   kubectl apply -f kubernetes/service.yaml
   kubectl apply -f kubernetes/ingress.yaml
   ```

4. Watch the rollout:

   ```bash
   kubectl rollout status deployment/web
   ```

## Verify

- Locally, `docker compose ps` shows `web`, `db`, and `cache` as running and healthy.
- In Kubernetes, `kubectl get pods` shows `web-*` pods `Running` and `Ready`, and `kubectl get svc` lists the `web` ClusterIP service.

## Common errors

- **Applying the manifests in the wrong order.** The StatefulSet references the `db-secret` and `db-svc` headless service, so apply the configmap, secret, and service before the StatefulSet and Deployment. Applying the Deployment first leaves the web pods CrashLooping until the db service exists.
- **Expecting a plain Deployment for the database.** The StatefulSet owns stable network identity (`db-0.db-svc`) and per-pod PVCs; a stateless Deployment is wrong for a stateful workload and is the most common mistake when porting a Compose `db` service by hand.
- **Stale config after editing the ConfigMap.** Pods read env values at container start. After changing `configmap.yaml`, re-apply it and roll the Deployment (`kubectl rollout restart deployment/web`) — otherwise the old values stay baked in.
