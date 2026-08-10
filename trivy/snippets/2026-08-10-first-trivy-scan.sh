# last_verified: 2026-08-10 · Trivy n/a

# I scanned the nginx:alpine image to see what Trivy finds out of the box
trivy image nginx:alpine

# I added --severity HIGH,CRITICAL to focus on the urgent stuff on my first run
trivy image --severity HIGH,CRITICAL nginx:alpine

# Saving as JSON so I can pipe it into something else later
trivy image --format json -o scan-report.json nginx:alpine
