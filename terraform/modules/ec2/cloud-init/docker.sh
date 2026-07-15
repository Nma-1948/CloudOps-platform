#!/bin/bash
set -eux

apt-get update

apt-get install -y \
docker.io \
git \
curl

systemctl enable docker
systemctl start docker

usermod -aG docker ubuntu

echo "Docker installation completed."
