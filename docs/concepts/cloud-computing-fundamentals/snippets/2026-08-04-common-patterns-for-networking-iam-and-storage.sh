#!/usr/bin/env bash
# last_verified: 2026-08-04 · bash n/a
# Common patterns for networking, IAM, and storage in cloud environments.
# I'm keeping these as reusable snippets — each block is a self-contained pattern
# I can drop into a larger script or run on its own.

# --- Networking: check DNS resolution ---
echo "--- DNS resolution check ---"
host google.com 2>/dev/null && echo "DNS works" || echo "DNS lookup failed"

# --- Networking: test port connectivity ---
echo "--- Port connectivity check ---"
nc -z -w5 google.com 443 2>/dev/null && echo "Port 443 open" || echo "Port 443 unreachable"

# --- Networking: trace route to a host ---
echo "--- Traceroute ---"
traceroute -m 10 google.com 2>/dev/null | head -5 || echo "traceroute not available"

# --- IAM: list current IAM user ---
echo "--- IAM identity ---"
aws sts get-caller-identity 2>/dev/null || echo "Not authenticated with AWS"

# --- IAM: list attached policies for a user ---
echo "--- Attached policies ---"
aws iam list-attached-user-policies --user-name "$(aws sts get-caller-identity --query UserName --output text 2>/dev/null)" 2>/dev/null || echo "Could not list policies"

# --- Storage: list S3 buckets ---
echo "--- S3 buckets ---"
aws s3 ls 2>/dev/null || echo "No S3 access or CLI not configured"

# --- Storage: check if a specific bucket exists ---
BUCKET_NAME="my-practice-bucket"
echo "--- Checking bucket: $BUCKET_NAME ---"
aws s3api head-bucket --bucket "$BUCKET_NAME" 2>/dev/null && echo "Bucket exists" || echo "Bucket does not exist or no access"

# --- Storage: upload a file with metadata ---
echo "--- Upload with metadata ---"
echo "test content" > /tmp/cf-upload-test.txt
aws s3 cp /tmp/cf-upload-test.txt "s3://my-practice-bucket/test-upload.txt" \
  --metadata "purpose=cf-practice" 2>/dev/null || echo "Upload failed — bucket may not exist"

# --- Storage: set bucket encryption ---
echo "--- Enabling bucket encryption ---"
aws s3api put-bucket-encryption \
  --bucket "$BUCKET_NAME" \
  --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}' 2>/dev/null || echo "Could not set encryption — check bucket permissions"

rm -f /tmp/cf-upload-test.txt
echo "=== Snippets complete ==="