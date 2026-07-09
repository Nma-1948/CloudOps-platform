provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project = "FastAPI-AI"
      Environment = "prod"
      ManagedBy   = "Terraform"
    }
  }
}
