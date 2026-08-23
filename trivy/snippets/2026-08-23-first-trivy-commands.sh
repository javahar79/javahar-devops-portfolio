# last_verified: 2026-08-23 · Trivy n/a

# Image scan — the most common use case, scans a container image for CVEs
trivy image nginx:alpine

# Only show HIGH and CRITICAL findings to cut through the noise
trivy image --severity HIGH,CRITICAL nginx:alpine

# Scan a local directory (the project filesystem) for vulnerabilities
trivy fs .

# Scan a directory but only look at OS packages
trivy fs --vuln-type os .

# Scan a Dockerfile or Kubernetes manifest for misconfigurations
trivy config ./k8s/

# Combine config scan with severity filter
trivy config --severity HIGH,CRITICAL ./k8s/

# Save results as JSON for pipeline parsing
trivy image --format json -o results.json nginx:alpine
