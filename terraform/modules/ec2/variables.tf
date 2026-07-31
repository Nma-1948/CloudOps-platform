variable "name" {
  description = "EC2 instance name"
  type        = string
}

variable "ami" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID"
  type        = string
}

variable "iam_instance_profile" {
  description = "IAM Instance Profile"
  type        = string
}

variable "associate_public_ip" {
  description = "Associate public IP"
  type        = bool
}

variable "user_data" {
  description = "User data script"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
}
