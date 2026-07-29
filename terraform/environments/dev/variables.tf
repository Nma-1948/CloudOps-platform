variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "alert_email" {
  description = "Email address for CloudWatch alerts"
  type        = string
}
