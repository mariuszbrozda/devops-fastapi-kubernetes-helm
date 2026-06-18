variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "cluster_version" {
  type        = string
  description = "Kubernetes version to use for the EKS cluster"
  default     = "1.31"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the cluster and workers will be deployed"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs"
}

variable "cluster_endpoint_private_access" {
  type        = bool
  description = "Enable private API server endpoint"
  default     = false
}

variable "cluster_endpoint_public_access" {
  type        = bool
  description = "Enable public API server endpoint"
  default     = true
}

variable "cluster_endpoint_public_access_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks that can access the public API server endpoint"
  default     = ["0.0.0.0/0"]
}

variable "node_desired_capacity" {
  type        = number
  description = "Desired number of worker nodes"
  default     = 2
}

variable "node_max_capacity" {
  type        = number
  description = "Maximum number of worker nodes"
  default     = 3
}

variable "node_min_capacity" {
  type        = number
  description = "Minimum number of worker nodes"
  default     = 1
}

variable "node_instance_types" {
  type        = list(string)
  description = "EC2 instance types for the worker nodes"
  default     = ["t3.small"]
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default     = {}
}

variable "node_capacity_type" {
  type        = string
  description = "EKS managed node group capacity type. Use ON_DEMAND or SPOT."
  default     = "SPOT"
}

variable "enable_cluster_creator_admin_permissions" {
  type        = bool
  description = "Enable admin permission for cluster creator"
  default     = true
}
