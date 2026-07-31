module "network" {
  source = "./modules/network"

  project_name = var.project_name
  environment  = var.environment

  tags = local.common_tags
}

module "security" {
  source = "./modules/security"

  project_name = var.project_name
  environment  = var.environment

  vpc_id = module.network.vpc_id

  tags = local.common_tags
}

module "iam" {
  source = "./modules/iam"

  project_name = var.project_name
  environment  = var.environment

  tags = local.common_tags
}

module "ec2" {
  source = "./modules/ec2"

  name                 = "${local.prefix}-${var.server_name}"
  ami                  = data.aws_ami.ubuntu.id
  instance_type        = var.instance_type

  subnet_id            = module.network.public_subnet_1_id
  security_group_id    = module.security.ec2_security_group_id
  iam_instance_profile = module.iam.instance_profile_name

  associate_public_ip = true

  user_data = templatefile("${path.module}/scripts/user_data.sh.tpl", {
    project_name = var.project_name
    environment  = var.environment
  })

  tags = local.common_tags
}

module "monitoring" {
  source = "./modules/monitoring"

  project_name = var.project_name
  environment  = var.environment

  instance_id = module.ec2.instance_id

  alert_email = var.alert_email

  cloudwatch_agent_config = jsonencode({
    agent = {
      metrics_collection_interval = 60
    }

    metrics = {
      namespace = "${var.project_name}/${var.environment}"
    }
  })

  tags = local.common_tags
}
