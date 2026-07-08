output "public_ip" {
  value = aws_eip.fastapi.public_ip
}

output "instance_id" {
  value = aws_instance.fastapi.id
}

output "public_dns" {
  value = aws_instance.fastapi.public_dns
}
