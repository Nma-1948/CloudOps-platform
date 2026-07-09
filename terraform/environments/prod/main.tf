module "ec2" {
  source = "../../modules/ec2"

  name              = "fastapi-server"
  ami               = data.aws_ami.ubuntu.id
  instance_type     = "t3.medium"

  vpc_id            = aws_vpc.main.id
  subnet_id         = aws_subnet.public_1.id
  security_group_id = aws_security_group.ec2_sg.id
}


