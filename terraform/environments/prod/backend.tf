terraform {
‎  backend "s3" {
‎    bucket ="nma1948-terraform-state-116101834005"
‎    key            = "prod/terraform.tfstate"
‎    region         = "eu-west-1"
‎    dynamodb_table = "terraform-lock"
‎    encrypt        = true
‎  }
‎}
