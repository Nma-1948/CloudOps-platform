output "vpc_id" {
  description = "VPC ID"
  value       = module.network.vpc_id
}

output "public_subnet_1_id" {
  description = "Public Subnet 1 ID"
  value       = module.network.public_subnet_1_id
}

output "public_subnet_2_id" {
  description = "Public Subnet 2 ID"
  value       = module.network.public_subnet_2_id
}

output "internet_gateway_id" {
  description = "Internet Gateway ID"
  value       = module.network.internet_gateway_id
}

output "route_table_id" {
  description = "Public Route Table ID"
  value       = module.network.route_table_id
}

output "ec2_instance_id" {
  description = "EC2 Instance ID"
  value       = module.ec2.instance_id
}

output "ec2_public_ip" {
  description = "EC2 Public IP"
  value       = module.ec2.public_ip
}

output "ec2_public_dns" {
  description = "EC2 Public DNS"
  value       = module.ec2.public_dns
}

output "security_group_id" {
  description = "EC2 Security Group ID"
  value       = module.security.ec2_security_group_id
}

output "iam_role_name" {
  description = "EC2 IAM Role"
  value       = module.iam.role_name
}

output "instance_profile_name" {
  description = "EC2 Instance Profile"
  value       = module.iam.instance_profile_name
}

output "sns_topic_arn" {
  description = "SNS Topic ARN"
  value       = module.monitoring.sns_topic_arn
}

output "cloudwatch_log_group" {
  description = "CloudWatch Log Group"
  value       = module.monitoring.log_group_name
}

output "cloudwatch_agent_parameter" {
  description = "CloudWatch Agent Parameter"
  value       = module.monitoring.cloudwatch_parameter_name
}
