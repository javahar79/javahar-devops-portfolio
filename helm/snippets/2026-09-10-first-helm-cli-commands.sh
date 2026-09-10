#!/usr/bin/env bash
# last_verified: 2026-09-10 · Helm n/a
# My first helm CLI commands - repo add, search, install, inspect

helm repo add bitnami https://charts.bitnami.com/bitnami
helm search repo nginx | head -5
helm install my-nginx bitnami/nginx --set service.type=NodePort
helm show chart bitnami/nginx
helm show readme bitnami/nginx
