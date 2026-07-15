#!/bin/bash
set -eux

echo "Installing K3s..."

# Install K3s
curl -sfL https://get.k3s.io | sh -

# Wait for the service to start
sleep 15

# Enable K3s
systemctl enable k3s
systemctl start k3s

# Create .kube directory for ubuntu user
mkdir -p /home/ubuntu/.kube

# Copy kubeconfig
cp /etc/rancher/k3s/k3s.yaml /home/ubuntu/.kube/config

# Update server address to localhost
sed -i 's/127.0.0.1/localhost/g' /home/ubuntu/.kube/config

# Give ownership to ubuntu user
chown -R ubuntu:ubuntu /home/ubuntu/.kube

# Configure kubectl environment
echo 'export KUBECONFIG=/home/ubuntu/.kube/config' >> /home/ubuntu/.bashrc

echo "K3s installation completed."
