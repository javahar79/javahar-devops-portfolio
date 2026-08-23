#!/usr/bin/env bash
# last_verified: 2026-08-23 · Trivy n/a

# I started with trivy image because the docs lead with container scanning
trivy image --severity HIGH,CRITICAL nginx:alpine

# trivy fs scans the local filesystem for vulnerabilities in project dependencies
trivy fs --severity HIGH,CRITICAL .

# trivy config checks Infrastructure as Code files for misconfigurations
trivy config --severity HIGH,CRITICAL ./deploy/
