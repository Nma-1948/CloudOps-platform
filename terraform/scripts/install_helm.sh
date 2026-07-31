#!/bin/bash
set -eux

echo "Installing Helm..."

curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

helm version

echo "Helm Installed"
