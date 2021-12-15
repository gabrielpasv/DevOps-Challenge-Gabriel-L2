data "aws_eks_cluster" "eks" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "eks" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks.token
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "17.24.0"

  cluster_version = "1.21"
  cluster_name    = "plana"
  vpc_id          = module.vpc.vpc_id
  subnets         = module.vpc.private_subnets


  worker_groups = [
    {
      name                 = "worker-group-1"
      instance_type        = "t3a.large"
      asg_desired_capacity = 2
      asg_max_size         = 2
    }
  ]
}
