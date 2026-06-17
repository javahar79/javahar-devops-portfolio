#!/bin/bash
# Install Terraform on Linux (amd64) and init my first project
# Ran this on 2026-06-17 — worked first try

# Download Terraform 1.8.5
wget https://releases.hashicorp.com/terraform/1.8.5/terraform_1.8.5_linux_amd64.zip

# Unzip to ~/bin (make sure it's in PATH)
unzip terraform_1.8.5_linux_amd64.zip -d ~/bin

# Check it works
terraform --version

# Init a scratch project to verify
mkdir -p ~/tf-first-project
cd ~/tf-first-project || exit

# Write a minimal config inline (see tf-003 for the real one)
cat > main.tf << 'EOF'
terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.4.0"
    }
  }
}

resource "local_file" "test" {
  content  = "terraform works"
  filename = "${path.module}/test.txt"
}
EOF

terraform init
# not sure if this is the right way to do it but it worked
terraform apply -auto-approve

# Cleanup demo
rm -f ~/tf-first-project/test.txt ~/tf-first-project/terraform.tfstate ~/tf-first-project/main.tf
