---
last_verified: 2026-07-12
tool_version: n/a
---

# Inspecting Pods, Services, and events — what I learned

After writing my first Deployment and Service manifests, I needed to actually verify they were working. Here's what I learned about inspecting things in Kubernetes.

## Getting pod details

`kubectl get pods` shows the basics — name, status, restarts, age. But when a pod is stuck in `CrashLoopBackOff` or `Pending`, I needed more.

`kubectl describe pod <name>` is the first thing I reach for now. It shows:
- The node the pod is scheduled on
- The container image and command
- Events at the bottom (why it failed, what's pending)
- Resource requests and limits

I had a pod stuck in `ImagePullBackOff` and `describe` showed the exact error: the image tag didn't exist on the registry. Saved me from guessing.

## Reading logs

`kubectl logs <pod>` dumps stdout from the container. When I had a pod that started but returned 500s on every request, the logs showed a missing environment variable.

A few things I tripped on:
- `kubectl logs` shows the current container's logs. If the pod restarted, use `--previous` to see the logs from the terminated container before the restart.
- For multi-container pods, you need `-c <container-name>` to pick which container's logs to stream.
- `kubectl logs -f <pod>` follows the log live — great for watching startup.

## Checking Services

`kubectl get services` lists all services and their cluster IPs. But the tricky part was verifying the service actually routes to my pods.

`kubectl describe service <name>` shows the endpoints (the pod IPs the service forwards to). If the Endpoints section is empty, the selector labels don't match any pods. I had this happen when I typo'd `app: my-app` as `app: myapp` in the deployment metadata.

I also learned `kubectl get endpoints` directly shows the same info in a compact table.

## Events tell the story

`kubectl get events` shows what's happened in the namespace recently. This was the most useful debugging tool when a pod wouldn't schedule because the node was out of resources. The event said `Failed to scale pod: Insufficient cpu` — the node had enough memory but not enough CPU cores for the request I'd set.

Events are automatically pruned after a while, so checking them right after a failure is important.

## What I'd try next

- Set up `kubectl get events --watch` during a deployment to see changes in real time
- Try `kubectl top pod` to see resource usage and compare against requests/limits
- Test `kubectl exec -it <pod> -- sh` to get a shell inside a running container for deeper inspection
