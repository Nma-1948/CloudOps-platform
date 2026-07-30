output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_1_id" {
  description = "Public Subnet 1 ID"
  value       = aws_subnet.public_1.id
}

output "public_subnet_2_id" {
  description = "Public Subnet 2 ID"
  value       = aws_subnet.public_2.id
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
  value       = aws_security_group.ec2_sg.id
}

output "iam_instance_profile" {
  description = "IAM Instance Profile"
  value       = aws_iam_instance_profile.ec2.name
}

output "sns_topic_arn" {
  description = "SNS Topic ARN"
  value       = aws_sns_topic.alerts.arn
}

output "cloudwatch_agent_parameter" {
  description = "CloudWatch Agent Parameter Store name"
  value       = aws_ssm_parameter.cloudwatch_agent_config.name
}
