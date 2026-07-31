variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "instance_id" {
  type = string
}

variable "alert_email" {
  type = string
}

variable "cloudwatch_agent_config" {
  type = string
}

variable "tags" {
  type = map(string)
}
