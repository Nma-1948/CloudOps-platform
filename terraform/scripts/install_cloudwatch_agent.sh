#!/bin/bash
set -eux

echo "Installing CloudWatch Agent..."

apt-get update

wget -O /tmp/amazon-cloudwatch-agent.deb \
https://amazoncloudwatch-agent.s3.amazonaws.com/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb

dpkg -i /tmp/amazon-cloudwatch-agent.deb

/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
  -a fetch-config \
  -m ec2 \
  -c ssm:/cloudops/${ENVIRONMENT}/cloudwatch-agent/config \
  -s

echo "CloudWatch Agent Installed"
