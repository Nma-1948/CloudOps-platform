

module "ec2" {
  source = "../../modules/ec2"

  name             = "ikenna-web-prod-ec2"
  ami = data.aws_ami.ubuntu.id 
  instance_type    = "t3.medium"
  vpc_id           = data.aws_vpc.main.id
  private_subnets  = data.aws_subnets.private.ids

  
}


