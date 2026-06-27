module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name                    = var.vpc_name
  cidr                    = var.vpc_cidr
  azs                     = var.azs
  public_subnets          = var.public_subnets
  private_subnets         = var.private_subnets
  enable_nat_gateway      = var.enable_nat_gateway
  single_nat_gateway      = var.single_nat_gateway
  enable_dns_hostnames    = var.enable_dns_hostnames
  enable_dns_support      = var.enable_dns_support
  public_subnet_tags      = var.public_subnet_tags
  private_subnet_tags     = var.private_subnet_tags
  tags                    = var.tags
  map_public_ip_on_launch = var.map_public_ip_on_launch
}

data "aws_availability_zones" "available" {
  state = "available"
}
