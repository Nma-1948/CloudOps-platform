resource "aws_security_group" "ec2_sg" {
  name        = "${local.prefix}-ec2-sg"
  description = "Security group for CloudOps EC2 instances"
  vpc_id      = aws_vpc.main.id

  tags = merge(
    local.common_tags,
    {
      Name = "${local.prefix}-ec2-sg"
    }
  )
}
