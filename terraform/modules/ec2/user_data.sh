#!/bin/bash
set -eux

echo "========== User Data Started =========="

apt-get update

####################################################
# Install CloudWatch Agent
####################################################

wget -O /tmp/amazon-cloudwatch-agent.deb \
https://amazoncloudwatch-agent.s3.amazonaws.com/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb

dpkg -i /tmp/amazon-cloudwatch-agent.deb

/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
-a fetch-config \
-m ec2 \
-c ssm:/amazon-cloudwatch-agent/config \
-s

####################################################
# Install Docker
####################################################

apt-get remove -y docker docker-engine docker.io containerd runc || true

apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
| gpg --dearmor -o /etc/apt/keyrings/docker.gpg

chmod a+r /etc/apt/keyrings/docker.gpg

echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
> /etc/apt/sources.list.d/docker.list

apt-get update

apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

systemctl enable docker
systemctl start docker

usermod -aG docker ubuntu

echo "========== Docker Installed =========="

####################################################
# Install Helm
####################################################

echo "========== Installing Helm =========="

curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

helm version

echo "========== Helm Installed =========="

####################################################
# Install K3s
####################################################

echo "========== Installing K3s =========="

curl -sfL https://get.k3s.io | sh -

echo "Waiting for K3s to start..."
sleep 20

systemctl enable k3s
systemctl start k3s

echo "========== K3s Installed =========="

# Configure kubectl for the ubuntu user
mkdir -p /home/ubuntu/.kube

cp /etc/rancher/k3s/k3s.yaml /home/ubuntu/.kube/config

sed -i "s/127.0.0.1/localhost/g" /home/ubuntu/.kube/config

chown -R ubuntu:ubuntu /home/ubuntu/.kube

echo 'export KUBECONFIG=/home/ubuntu/.kube/config' >> /home/ubuntu/.bashrc
