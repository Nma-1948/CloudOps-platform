#!/bin/bash
set -eux

echo "Installing K3s..."

curl -sfL https://get.k3s.io | sh -

systemctl enable k3s

systemctl start k3s

until [ -f /etc/rancher/k3s/k3s.yaml ]; do
    sleep 2
done

echo "K3s Installed"
