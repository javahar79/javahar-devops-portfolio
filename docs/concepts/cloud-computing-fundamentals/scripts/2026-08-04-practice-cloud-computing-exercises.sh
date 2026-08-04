#!/usr/bin/env bash
# last_verified: 2026-08-04 · bash n/a
# I'm practicing cloud CLI commands — this script exercises provisioning and
# managing cloud resources. I'm using AWS CLI as the example since it's the
# most common, but the patterns apply to gcloud and az too.

echo "=== Cloud Computing Fundamentals — CLI Practice ==="

# 1. List existing S3 buckets to see what's already there
echo "--- Listing S3 buckets ---"
aws s3 ls 2>/dev/null || echo "AWS CLI not configured or no buckets — that's fine for practice"

# 2. Create a bucket (unique name required — using timestamp to avoid collisions)
BUCKET_NAME="cf-fundamentals-practice-$(date +%s)"
echo "--- Creating bucket: $BUCKET_NAME ---"
aws s3 mb "s3://$BUCKET_NAME" 2>/dev/null || echo "Could not create bucket — check AWS credentials"

# 3. Upload a test file to the bucket
echo "--- Uploading test file ---"
echo "hello from cloud fundamentals" > /tmp/cf-test-file.txt
aws s3 cp /tmp/cf-test-file.txt "s3://$BUCKET_NAME/test.txt" 2>/dev/null || echo "Upload failed — skipping"

# 4. List objects in the bucket
echo "--- Listing objects ---"
aws s3 ls "s3://$BUCKET_NAME/" 2>/dev/null || echo "Could not list objects"

# 5. Create an IAM user (practice — not actual provisioning)
echo "--- IAM user practice ---"
aws iam create-user --user-name "cf-practice-user" 2>/dev/null || echo "IAM user creation failed — check permissions"

# 6. Attach a read-only policy to the user
echo "--- Attaching read-only policy ---"
aws iam attach-user-policy \
  --user-name "cf-practice-user" \
  --policy-arn "arn:aws:iam::aws:policy/ReadOnlyAccess" 2>/dev/null || echo "Policy attach failed — skipping"

# 7. Clean up — remove the test object and bucket
echo "--- Cleaning up ---"
aws s3 rm "s3://$BUCKET_NAME/test.txt" 2>/dev/null || true
aws s3 rb "s3://$BUCKET_NAME" 2>/dev/null || true
aws iam detach-user-policy \
  --user-name "cf-practice-user" \
  --policy-arn "arn:aws:iam::aws:policy/ReadOnlyAccess" 2>/dev/null || true
aws iam delete-user --user-name "cf-practice-user" 2>/dev/null || true
rm -f /tmp/cf-test-file.txt

echo "=== Practice complete ==="