output "sns_topic_arn" {
  value = aws_sns_topic.alerts.arn
}

output "log_group_name" {
  value = aws_cloudwatch_log_group.application.name
}

output "cloudwatch_parameter_name" {
  value = aws_ssm_parameter.cloudwatch_agent_config.name
}
