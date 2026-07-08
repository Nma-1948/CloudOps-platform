variable "vpc_id" {}

variable "private_subnets" {
  type = list(string)
}



variable "ami" {
  default = "ami-09d0c9a85bf1b9ea7" # Ubuntu (your region)
}

variable "instance_type" {
  default = "t3.medium"
}

variable "name" {
  default = "app-ec2"
}
