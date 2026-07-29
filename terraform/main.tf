module "ec2" {
  source = "./modules/ec2"

  name                 = "cloudops-${var.environment}-server"
  ami                  = data.aws_ami.ubuntu.id
  instance_type        = var.instance_type
  subnet_id            = aws_subnet.public_1.id
  security_group_id    = aws_security_group.ec2_sg.id
  iam_instance_profile = aws_iam_instance_profile.ec2.name
  associate_public_ip  = true
}
