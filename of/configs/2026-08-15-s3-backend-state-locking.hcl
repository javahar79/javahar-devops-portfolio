# last_verified: 2026-08-15 · OpenTofu

# Backend config: keep state in S3 so my laptop isn't the only source of truth.
# The DynamoDB table does the locking so two `tofu apply` runs can't race.

terraform {
  backend "s3" {
    bucket         = "my-opentofu-state"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "opentofu-state-locks"
    encrypt        = true
  }
}