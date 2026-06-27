provider "aws" {
  region  = var.region
  profile = ""
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint_private_access
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}