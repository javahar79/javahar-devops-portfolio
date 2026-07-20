#!/bin/bash
# last_verified: 2026-07-19 · kubectl n/a
#
# Troubleshooting pods the way the quickstart taught me: logs first,
# then describe when logs aren't enough. Running these against a live
# cluster in minikube while I learned.

# point kubectl at my local cluster
kubectl config use-context minikube

# start by listing pods so I know what's actually running (or crashing)
kubectl get pods

# the pod name I'm chasing — swap for whatever "CrashLoopBackOff" pod you see
POD="web-app-7d9c8b6f4-xyz12"

# tail the logs; if the container restarted, --previous shows the crash
kubectl logs "$POD"
kubectl logs "$POD" --previous

# logs from a specific container when a pod runs more than one
kubectl logs "$POD" -c nginx

# when logs are empty or unhelpful, describe dumps events: image pulls,
# failed probes, scheduling problems — usually the real cause
kubectl describe pod "$POD"

# if a pod won't even start, the events on the deployment tell the story
kubectl describe deployment web-app

# get inside a running container to poke around when I'm truly stuck
kubectl exec -it "$POD" -- sh
