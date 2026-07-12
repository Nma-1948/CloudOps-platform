output "instance_id" {
  value = aws_instance.app.id
}

output "public_ip" {
  value = aws_eip.app.public_ip
}

output "private_ip" {
  value = aws_instance.app.private_ip
}

output "elastic_ip_allocation_id" {
  value = aws_eip.app.id
}
