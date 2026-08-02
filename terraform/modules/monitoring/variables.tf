variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "instance_id" {
  description = "EC2 instance ID"
  type        = string
}

variable "alert_email" {
  description = "Email address for monitoring alerts"
  type        = string
}

variable "cloudwatch_agent_config" {
  description = "CloudWatch Agent configuration"
  type        = string
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
}
