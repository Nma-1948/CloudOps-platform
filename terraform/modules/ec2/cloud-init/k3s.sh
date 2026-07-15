#!/bin/bash
set -eux

curl -sfL https://get.k3s.io | sh -

systemctl enable k3s

kubectl get nodes || true

echo "K3s installation completed."
