variable "region" {
  default = "eu-west-1"
}

variable "alert_email" {
  description = "Email address for cloudwatch alerts"
  type        = string
}


