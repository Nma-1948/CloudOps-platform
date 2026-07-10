resource "aws_instance" "app" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true

  user_data = <<-EOF
#!/bin/bash
set -eux

# Update packages
apt-get update -y

# Install Nginx
apt-get install -y nginx
systemctl enable nginx
systemctl start nginx

# Install CloudWatch Agent
wget https://amazoncloudwatch-agent.s3.amazonaws.com/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
dpkg -i amazon-cloudwatch-agent.deb

# Start CloudWatch Agent using SSM Parameter Store
/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
  -a fetch-config \
  -m ec2 \
  -c ssm:/amazon-cloudwatch-agent/config \
  -s
EOF

  tags = {
    Name = var.name
  }
}

resource "time_sleep" "wait_for_instance" {
  depends_on = [aws_instance.app]

  create_duration = "30s"
}
