data "aws_eks_cluster" "cluster" {
  name = module.eks_cluster.cluster_name

  depends_on = [module.eks_cluster]
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks_cluster.cluster_name

  depends_on = [data.aws_eks_cluster.cluster]
}