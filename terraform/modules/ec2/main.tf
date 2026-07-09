resource "aws_instance" "app" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true

  user_data = <<-EOF
#!/bin/bash
apt update -y
apt install -y nginx
systemctl enable nginx
systemctl start nginx
EOF

  tags = {
    Name = var.name
  }
}

resource "time_sleep" "wait_for_instance" {
  depends_on = [aws_instance.app]

  create_duration = "30s"
}
