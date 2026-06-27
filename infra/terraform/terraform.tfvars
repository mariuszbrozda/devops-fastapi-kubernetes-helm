region      = "us-east-1"
environment = "dev"

# VPC Configuration
vpc_name                = "online-store-vpc"
vpc_cidr                = "10.0.0.0/16"
public_subnets          = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets         = ["10.0.101.0/24", "10.0.102.0/24"]
map_public_ip_on_launch = true
enable_nat_gateway      = true

# ECR Configuration
ecr_repository_name = "online-store"

common_tags = {
  Environment = "dev"
  ManagedBy   = "Terraform"
}

# EKS Cluster Configuration
enable_cluster_creator_admin_permissions = true
cluster_name                             = "online-store-eks-cluster"
cluster_version                          = "1.35"
node_desired_capacity                    = 1
node_max_capacity                        = 2
node_min_capacity                        = 1
node_instance_types                      = ["t3.medium"]



