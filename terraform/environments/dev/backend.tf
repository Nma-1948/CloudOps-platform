terraform {
  backend "s3" {
    bucket  = "nma1948-terraform-state-116101834005"
    key     = "dev/terraform.tfstate"
    region  = "eu-west-1"
    encrypt = true

    use_lockfile = true
  }
}
