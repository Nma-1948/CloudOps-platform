resource "aws_instance" "app" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  iam_instance_profile        = var.iam_instance_profile
  associate_public_ip_address = true

  user_data = templatefile(
    "${path.module}/cloud-init/cloud-init.yaml",
    {}
  )

  tags = {
    Name = var.name
  }
}

resource "time_sleep" "wait_for_instance" {
  depends_on = [aws_instance.app]

  create_duration = "30s"
}

resource "aws_eip" "app" {
  domain = "vpc"

  instance = aws_instance.app.id

  tags = {
    Name = "${var.name}-eip"
  }
}


