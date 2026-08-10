# last_verified: 2026-08-10 · Pulumi n/a

import pulumi
from pulumi_aws import s3

# My first Pulumi program — I'm creating an S3 bucket to test the workflow
# Need: pulumi installed, pulumi_aws package installed, AWS credentials configured
bucket = s3.Bucket("my-first-bucket")

# Export the bucket name so I can see it in `pulumi up` output
pulumi.export("bucket-name", bucket.id)
