#!/bin/bash
# last_verified: 2026-07-21 · terraform n/a

mkdir -p tf-vars-demo && cd tf-vars-demo || exit
cat > main.tf <<'EOF'
variable "greeting" {
  type    = string
  default = "hello from vars"
}

output "text" {
  value = var.greeting
}
EOF
