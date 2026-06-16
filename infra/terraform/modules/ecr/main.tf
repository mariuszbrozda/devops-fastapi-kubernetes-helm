module "ecr" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "~> 1.6"

  repository_name            = var.repository_name
  repository_image_tag_mutability = var.image_tag_mutability
  repository_image_scan_on_push   = var.scan_on_push
  repository_encryption_type = var.encryption_type
  repository_encryption_key_arn = var.encryption_key_arn

  repository_lifecycle_policy = var.repository_lifecycle_policy

  tags = var.tags
}
