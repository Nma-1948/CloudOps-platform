resource "aws_security_group" "ec2_sg" {
  name        = "${local.prefix}-ec2-sg"
  description = "Security group for CloudOps EC2 instances"
  vpc_id      = aws_vpc.main.id

  tags = merge(
    local.common_tags,
    {
      Name = "${local.prefix}-ec2-sg"
    }
  )
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.ec2_sg.id

  description = "Allow HTTP"

  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"

  cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.ec2_sg.id

  description = "Allow HTTPS"

  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"

  cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "backend" {
  security_group_id = aws_security_group.ec2_sg.id

  description = "Backend API"

  from_port   = 3000
  to_port     = 3000
  ip_protocol = "tcp"

  cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "k3s" {
  security_group_id = aws_security_group.ec2_sg.id

  description = "K3s API"

  from_port   = 6443
  to_port     = 6443
  ip_protocol = "tcp"

  cidr_ipv4 = "10.0.0.0/16"
}

resource "aws_vpc_security_group_egress_rule" "all" {
  security_group_id = aws_security_group.ec2_sg.id

  ip_protocol = "-1"

  cidr_ipv4 = "0.0.0.0/0"
}
