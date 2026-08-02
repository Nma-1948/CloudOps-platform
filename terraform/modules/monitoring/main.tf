

resource "aws_ssm_parameter" "cloudwatch_agent_config" {
  name = "/${var.project_name}/${var.environment}/cloudwatch-agent/config"
  type = "String"

  value = var.cloudwatch_agent_config

  tags = var.tags
}

