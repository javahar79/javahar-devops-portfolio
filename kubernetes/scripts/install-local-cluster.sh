#!/usr/bin/env bash
# Install kind and create a local Kubernetes cluster
# Tested on Ubuntu 22.04

KIND_VERSION="v0.20.0"

curl -Lo ./kind "https://kind.sigs.k8s.io/dl/${KIND_VERSION}/kind-linux-amd64"
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

kind create cluster --name dev-cluster

kubectl get nodes
kubectl get pods --all-namespaces
