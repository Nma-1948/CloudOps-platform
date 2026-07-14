resource "aws_instance" "app" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.public_subnets[0]
  vpc_security_group_ids = [data.aws_security_group.ec2_sg.id]

  user_data = templatefile(
    "${path.module}/templates/cloud-init.yaml",
    {
      hostname = var.name
    }
  )

  tags = {
    Name = var.name
  }
}

resource "aws_eip" "app" {
  domain = "vpc"

  instance = aws_instance.app.id

  tags = {
    Name = "${var.name}-eip"
  }
}


