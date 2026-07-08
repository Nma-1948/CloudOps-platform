resource "aws_instance" "fastapi" {

  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.medium"

  subnet_id                   = aws_subnet.public_1.id

  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]

  associate_public_ip_address = true

  iam_instance_profile = aws_iam_instance_profile.ec2.name

  tags = {
    Name = "fastapi-server"
  }
}

resource "aws_eip" "fastapi" {

  domain = "vpc"

  instance = aws_instance.fastapi.id

  tags = {
    Name = "fastapi-eip"
  }
}
