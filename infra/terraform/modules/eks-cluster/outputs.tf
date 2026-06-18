output "cluster_id" {
  value       = module.eks.cluster_id
  description = "The ID/name of the EKS cluster"
}

output "cluster_name" {
  value       = module.eks.cluster_id
  description = "The name of the EKS cluster"
}

output "cluster_arn" {
  value       = module.eks.cluster_arn
  description = "The Amazon Resource Name (ARN) of the cluster"
}

output "cluster_endpoint" {
  value       = module.eks.cluster_endpoint
  description = "Endpoint for your Kubernetes API server"
}

output "cluster_certificate_authority_data" {
  value       = module.eks.cluster_certificate_authority_data
  description = "Base64 encoded certificate data required to communicate with the cluster"
  sensitive   = true
}

output "cluster_version" {
  value       = module.eks.cluster_version
  description = "The Kubernetes server version for the cluster"
}

output "node_group_id" {
  value       = module.eks.eks_managed_node_groups["default"].node_group_id
  description = "EKS managed node group id"
}

output "node_group_status" {
  value       = module.eks.eks_managed_node_groups["default"].node_group_status
  description = "Status of the EKS managed node group"
}
