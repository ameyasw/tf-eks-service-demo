module "eks_service" {
  source = "../../modules/eks-service"

  name   = "demo"
  region = var.region

  cluster_endpoint_public_access_cidrs = var.allowed_cidrs

  tags = {
    Project = "eks-service-demo"
  }
}
