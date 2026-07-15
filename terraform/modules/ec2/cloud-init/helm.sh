#!/bin/bash
set -eux

echo "Installing Helm..."

# Download and install Helm
curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Verify installation
helm version

echo "Helm installation completed."
