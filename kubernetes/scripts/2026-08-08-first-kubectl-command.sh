#!/bin/bash
# last_verified: 2026-08-08 · kubernetes n/a
# My first kubectl commands to list cluster nodes

kubectl version --client
kubectl cluster-info
kubectl get nodes
kubectl describe node "$(kubectl get nodes -o jsonpath='{.items[0].metadata.name}')"
