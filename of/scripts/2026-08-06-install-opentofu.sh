#!/usr/bin/env bash
# last_verified: 2026-08-06 · OpenTofu n/a

# Install OpenTofu and verify the installation with tofu version

TOFU_VERSION="1.8.0"
INSTALL_DIR="$HOME/.local/bin"

mkdir -p "$INSTALL_DIR"

curl -s -o /tmp/tofu.zip "https://github.com/opentofu/opentofu/releases/download/v${TOFU_VERSION}/tofu_${TOFU_VERSION}_linux_amd64.zip"
unzip -o /tmp/tofu.zip -d "$INSTALL_DIR"
chmod +x "$INSTALL_DIR/tofu"

rm -f /tmp/tofu.zip

export PATH="$INSTALL_DIR:$PATH"

tofu version