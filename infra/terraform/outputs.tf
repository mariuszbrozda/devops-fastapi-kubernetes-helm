# VPC Outputs
output "vpc_id" {
  value       = module.networking.vpc_id
  description = "The ID of the VPC"
}

output "private_subnets" {
  value       = module.networking.private_subnets
  description = "List of IDs of private subnets"
}

output "public_subnets" {
  value       = module.networking.public_subnets
  description = "List of IDs of public subnets"
}

output "nat_gateway_ips" {
  value       = module.networking.nat_gateway_ips
  description = "List of Elastic IPs created for NAT gateways"
}

# ECR Outputs
output "registry_url" {
  value       = module.ecr.repository_url
  description = "AWS ECR repository URL"
}

output "registry_name" {
  value       = module.ecr.repository_name
  description = "AWS ECR repository name"
}

output "registry_arn" {
  value       = module.ecr.repository_arn
  description = "AWS ECR repository ARN"
}

# Provider Outputs
output "region" {
  value       = var.region
  description = "AWS region"
}


# EKS Cluster Outputs
output "cluster_name" {
  value       = module.eks_cluster.cluster_id
  description = "EKS cluster name"
}

output "cluster_endpoint" {
  value       = module.eks_cluster.cluster_endpoint
  description = "EKS cluster API endpoint"
}

output "cluster_arn" {
  value       = module.eks_cluster.cluster_arn
  description = "The Amazon Resource Name (ARN) of the cluster"
}

output "cluster_cert" {
  value       = module.eks_cluster.cluster_certificate_authority_data
  description = "Base64 encoded certificate authority data for the cluster"
  sensitive   = true
}

output "cluster_version" {
  value       = module.eks_cluster.cluster_version
  description = "The Kubernetes server version for the cluster"
}

output "node_group_id" {
  value       = module.eks_cluster.node_group_id
  description = "EKS managed node group id"
}

output "node_group_status" {
  value       = module.eks_cluster.node_group_status
  description = "Status of the EKS managed node group"
}
