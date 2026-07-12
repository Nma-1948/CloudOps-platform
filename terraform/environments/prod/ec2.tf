

resource "aws_eip" "fastapi" {

  domain = "vpc"

  instance = aws_instance.fastapi.id

  tags = {
    Name = "fastapi-eip"
  }
}
