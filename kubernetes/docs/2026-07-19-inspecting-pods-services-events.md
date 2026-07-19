---
last_verified: 2026-07-19
tool_version: n/a
---

# Inspecting Pods, Services, and events — what I tripped on

I had three Pods, a Service, and no idea if traffic was actually flowing. Here's how I worked through inspecting each layer and what caught me off guard.

## Step 1 — Check the Pods are actually running

`kubectl get pods -o wide` gives you name, status, restarts, age, node, and pod IP in one table. The `-o wide` flag is easy to miss — the default output doesn't show the pod IP, which I needed later to test connectivity directly.

I had a pod stuck in `CrashLoopBackOff`. `kubectl describe pod <name>` showed the container was starting and immediately exiting with code 1. The Events section at the bottom said `Back-off restarting failed container`. I had to scroll past the container spec to find the real cause: the command I'd set in the Dockerfile was wrong for the image tag.

`kubectl logs <pod>` showed the startup error. But if you run logs on a pod that's currently restarting, you get the current (empty) container's logs. Use `kubectl logs <pod> --previous` to see the previous terminated container's output.

## Step 2 — Verify the Service routes traffic

`kubectl get svc` showed my Service with a cluster IP, but the pod still wasn't reachable. `kubectl describe svc <name>` has an Endpoints line — if it's empty, the Service selector doesn't match any pod labels.

That was my problem. My deployment had `app: web` and my Service selector had `app: webserver`. They looked the same to me until I read them side by side. Once I matched the labels, endpoints showed up.

I also ran `kubectl get endpoints` — cleaner output than digging through describe output.

## Step 3 — Port-forward to smoke-test

Even with endpoints populated, I couldn't curl the cluster IP from outside the cluster. `kubectl port-forward svc/<name> 8080:80` tunnels a local port to the Service. Once that worked, I knew the Service was wired correctly.

I initially tried `kubectl port-forward pod/<name>` — that also works but bypasses the Service entirely. Port-forwarding to the Service is a better test because it exercises the selector and load balancing.

## Step 4 — Events catch what nothing else shows

`kubectl get events --sort-by='.lastTimestamp'` shows recent events in chronological order. When a pod stayed `Pending` and no describe output looked wrong, I ran this and saw `Failed to pull image "my-app:latest"` — the image tag didn't exist in the registry. Events are automatically cleaned up after a while, so check them early.

## What I'd try next

- Set resource requests and limits, then use `kubectl top pod` to see actual vs requested usage
- Test `kubectl exec -it <pod> -- sh` to debug from inside a container
- Use `kubectl get events -w` during a deployment to watch events stream in real time
