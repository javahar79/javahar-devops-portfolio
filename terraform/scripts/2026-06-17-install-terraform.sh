#!/bin/bash
# Install Terraform 1.8.5 and init first project — 2026-06-17
wget -q https://releases.hashicorp.com/terraform/1.8.5/terraform_1.8.5_linux_amd64.zip
unzip -qo terraform_1.8.5_linux_amd64.zip -d ~/bin && terraform --version
mkdir -p ~/tf-first-project && cd ~/tf-first-project || exit
cat > main.tf <<'EOF'
terraform { required_providers { local = { source = "hashicorp/local", version = "2.4.0" } } }
resource "local_file" "test" { content = "terraform works", filename = "${path.module}/test.txt" }
EOF
terraform init
rm -f main.tf terraform.tfstate*
