variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "github_owner" {
  description = "GitHub username or organization"
  type        = string
}

variable "github_repository" {
  description = "GitHub repository name"
  type        = string
}

variable "github_branch" {
  description = "GitHub branch allowed to deploy"
  type        = string
  default     = "main"
}

variable "role_name" {
  description = "IAM role name for GitHub Actions"
  type        = string
  default     = "github-actions-terraform"
}
