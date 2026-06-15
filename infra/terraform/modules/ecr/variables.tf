variable "repository_name" {
  type        = string
  description = "Name of the ECR repository"
}

variable "image_tag_mutability" {
  type        = string
  description = "The tag mutability setting for the repository"
  default     = "MUTABLE"
}

variable "encryption_type" {
  type        = string
  description = "The encryption type to use"
  default     = "AES256"
}

variable "scan_on_push" {
  type        = bool
  description = "Enable image scanning on push"
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default     = {}
}
