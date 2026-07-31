module "ec2" {
  source = "./modules/ec2"

  name                 = "${local.prefix}-${var.server_name}"
  ami                  = data.aws_ami.ubuntu.id
  instance_type        = var.instance_type
  subnet_id            = module.network.public_subnet_1_id
  security_group_id    = module.security.ec2_security_group_id
  iam_instance_profile = module.iam.instance_profile_name
  associate_public_ip  = true

  user_data = templatefile("${path.module}/scripts/user_data.sh.tpl", {
    project_name = var.project_name
    environment  = var.environment
  })

  tags = local.common_tags
}
