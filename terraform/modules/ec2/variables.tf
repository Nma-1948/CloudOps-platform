variable "name" {
  type = string
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "iam_instance_profile" {
  type = string
}

variable "associate_public_ip" {
  type    = bool
  default = true
}
