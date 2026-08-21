---
last_verified: 2026-08-21
tool_version: "n/a"
sources: []
---

# Kubernetes service networking: ClusterIP, NodePort, LoadBalancer, and Ingress compared

## Purpose

This doc compares the four primary ways to expose workloads in Kubernetes: ClusterIP, NodePort, LoadBalancer, and Ingress. Each type solves a different access problem — internal service discovery, ephemeral node-level access, cloud-provider load balancing, and HTTP routing — and understanding when to use which prevents over-provisioning or misconfiguring network paths.

## When to use each type

### ClusterIP (default)

ClusterIP assigns a stable internal IP address reachable only within the cluster. Use it for service-to-service communication where external access is not required. Most microservice architectures default to ClusterIP for backend services.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: backend-api
spec:
  type: ClusterIP
  selector:
    app: backend
  ports:
    - port: 80
      targetPort: 8080
```

### NodePort

NodePort opens a static port on every node in the cluster (range 30000–32767 by default). Traffic hitting any node on that port forwards to the service. Use it for development or testing where you need direct node-level access without a cloud load balancer. Avoid it in production because it exposes raw node IPs and consumes high-numbered ports.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: frontend
spec:
  type: NodePort
  selector:
    app: frontend
  ports:
    - port: 80
      targetPort: 3000
      nodePort: 30080
```

### LoadBalancer

LoadBalancer provisions an external IP through the cloud provider's load balancer (AWS ELB, GCP forwarding rule, Azure LB). Use it when you need a single entry point for external traffic. The downside is one load balancer per service — in clusters with many external services, this multiplies cost and management overhead.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: api-gateway
spec:
  type: LoadBalancer
  selector:
    app: api-gateway
  ports:
    - port: 443
      targetPort: 8443
```

### Ingress

Ingress sits in front of one or more Services and routes HTTP/HTTPS traffic based on hostnames and paths. It requires an Ingress Controller (nginx, traefik, HAProxy, etc.) running in the cluster. Use it to consolidate multiple HTTP services behind a single external endpoint with path-based or host-based routing. Ingress handles L7 (HTTP) traffic only — for TCP/UDP, stick with LoadBalancer or NodePort.

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: web-ingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  ingressClassName: nginx
  rules:
    - host: app.example.com
      http:
        paths:
          - path: /api
            pathType: Prefix
            backend:
              service:
                name: backend-api
                port:
                  number: 80
          - path: /
            pathType: Prefix
            backend:
              service:
                name: frontend
                port:
                  number: 80
```

## Comparison table

| Type | Scope | External access | Protocol | Typical use |
|------|-------|-----------------|----------|-------------|
| ClusterIP | Cluster-internal | No | TCP, UDP, gRPC | Backend microservices |
| NodePort | All nodes | Yes (high port) | TCP, UDP | Dev/test, quick debugging |
| LoadBalancer | Cloud provider | Yes (public IP) | TCP, UDP | Single-service production exposure |
| Ingress | HTTP/HTTPS | Yes (single IP) | HTTP, HTTPS | Multi-service HTTP routing |

## Common errors

- **Forgetting `selector` labels:** If the Service selector does not match any Pod labels, the Service has no endpoints and traffic silently drops. Check with `kubectl get endpoints <svc>` — an empty endpoint list means no match.
- **NodePort range conflicts:** Attempting to use a port outside 30000–32767 causes an API server validation error. Stick to the default range or adjust `--service-node-port-range` on the API server.
- **LoadBalancer without a cloud provider:** On bare-metal or local clusters (minikube, kind), LoadBalancer services stay in `Pending` forever unless you install a MetalLB or similar load balancer controller.
- **Ingress without a controller:** Creating an Ingress resource without an Ingress Controller installed means nothing processes the rules. The Ingress object exists but traffic never routes. Install a controller (e.g., nginx ingress controller) before creating Ingress resources.
- **Service stuck in `<pending>` for LoadBalancer:** No cloud provider or MetalLB installed. Use `kubectl describe svc <name>` to see the events — the cloud controller will log the failure.
- **Ingress returns 404:** The Ingress Controller cannot find the backend service. Verify the `service.name` and `service.port.number` match the actual Service resource.
- **NodePort connection refused:** The Pod behind the Service is not running or the container is not listening on `targetPort`. Check `kubectl get pods -l app=<label>` and `kubectl logs <pod>`.

## Verify

```bash
# ClusterIP — test from inside the cluster
kubectl run curl --image=curlimages/curl --rm -it --restart=Never -- curl -s http://backend-api

# NodePort — test from any node IP
NODE_IP=$(kubectl get nodes -o jsonpath='{.items[0].status.addresses[?(@.type=="InternalIP")].address}')
curl -s http://$NODE_IP:30080

# LoadBalancer — test the external IP (takes a minute to provision)
kubectl get svc api-gateway -w  # wait for EXTERNAL-IP to leave <pending>
curl -s http://<EXTERNAL-IP>

# Ingress — test with Host header
curl -s -H "Host: app.example.com" http://<INGRESS-EXTERNAL-IP>/api/health
```
