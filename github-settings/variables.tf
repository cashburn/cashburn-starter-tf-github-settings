variable "github_token" {
  type      = string
  sensitive = true
}

variable "github_owner" {
  type        = string
  description = "GitHub organization or user"
}

variable "repository_name" {
  type        = string
  description = "Repository to manage"
}
