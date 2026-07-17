data "aws_security_group" "ec2_sg" {
  name   = "my-app-sg"
  vpc_id = var.vpc_id
}

resource "aws_instance" "app" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [data.aws_security_group.ec2_sg.id]
  iam_instance_profile        = var.instance_profile
  associate_public_ip_address = var.associate_public_ip

  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name = var.name
  }
}
