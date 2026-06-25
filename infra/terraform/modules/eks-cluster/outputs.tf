output "cluster_id" {
  value       = module.eks.cluster_id
  description = "The ID/name of the EKS cluster"
}

output "cluster_name" {
  value       = module.eks.cluster_name
  description = "The name of the EKS cluster"
}

output "region" {
  description = "AWS region"
  value       = var.region
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
}

output "cluster_version" {
  value       = module.eks.cluster_version
  description = "The Kubernetes server version for the cluster"
}

output "cluster_platform_version" {
  description = "Platform version for the cluster"
  value       = module.eks.cluster_platform_version
}

output "cluster_status" {
  description = "Status of the EKS cluster. CREATING | ACTIVE | DELETING | FAILED"
  value       = module.eks.cluster_status
}

output "cluster_primary_security_group_id" {
  description = "Cluster SG that was created by Amazon EKS for the cluster. Managed node groups use this SG for ControlPlan-to-DataPlane communication"
  value       = module.eks.cluster_primary_security_group_id
}

output "cluster_security_group_arn" {
  description = "Cluster SG ARN"
  value       = module.eks.cluster_security_group_arn
}

output "cluster_security_group_id" {
  description = "Cluster SG ID"
  value       = module.eks.cluster_security_group_id
}

output "node_group_id" {
  value       = module.eks.eks_managed_node_groups["default_node_group"].node_group_id
  description = "EKS managed node group id"
}

output "node_security_group_arn" {
  description = "Shared SG ARN"
  value       = module.eks.node_security_group_arn
}

output "node_security_group_id" {
  description = "Shared SG ID"
  value       = module.eks.node_security_group_id
}

output "cluster_tls_certificate_sha1_fingerprint" {
  description = "SHA1 fingerprint of the pub-key of the cluster's certificate"
  value       = module.eks.cluster_tls_certificate_sha1_fingerprint
}

output "node_group_status" {
  value       = module.eks.eks_managed_node_groups["default_node_group"].node_group_status
  description = "Status of the EKS managed node group"
}

