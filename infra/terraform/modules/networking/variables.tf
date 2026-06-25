variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnets" {
  type        = list(string)
  description = "CIDR blocks for public subnets"
}

variable "private_subnets" {
  type        = list(string)
  description = "CIDR blocks for private subnets"
}

variable "enable_nat_gateway" {
  type        = bool
  description = "Enable NAT gateway"
  default     = true
}

variable "single_nat_gateway" {
  type        = bool
  description = "Use a single NAT gateway for all private subnets"
  default     = true
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in the VPC"
  default     = true
}

variable "enable_dns_support" {
  type        = bool
  description = "Enable DNS support in the VPC"
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default     = {}
}

variable "public_subnet_tags" {
  type        = map(string)
  description = "Public subnets Tags"
  default     = {"kubernetes.io/role/elb" = 1}
}

variable "private_subnet_tags" {
  type        = map(string)
  description = "Private subnets Tags"
  default     = {"kubernetes.io/role/internal-elb" = 1}
}


