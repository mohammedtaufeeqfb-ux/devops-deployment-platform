module "networking" {
  source = "./modules/networking"

  project_name = var.project_name
}
module "security" {

  source = "./modules/security"

  project_name = var.project_name

  vpc_id = module.networking.vpc_id
}
module "iam" {

  source = "./modules/iam"

  project_name = var.project_name
}

module "ec2" {
  source = "./modules/ec2"

  ami_id        = "ami-0f58b397bc5c1f2e8"
  instance_type = "t3.micro"
  key_name      = var.key_name

  subnet_id         = module.networking.public_subnet_a_id
  security_group_id = module.security.security_group_id

  instance_profile_name = module.iam.instance_profile_name
  project_name          = var.project_name
}

module "ecr" {
  source       = "./modules/ecr"
  project_name = var.project_name
}

module "eks" {
  source = "./modules/eks"

  project_name       = var.project_name
  cluster_subnet_ids = module.networking.private_subnet_ids
  node_subnet_ids    = module.networking.public_subnet_ids

  cluster_role_arn = module.iam.eks_cluster_role_arn
  node_role_arn    = module.iam.eks_node_role_arn
}

resource "aws_eks_access_entry" "github_actions" {
  cluster_name  = module.eks.cluster_name
  principal_arn = module.iam.github_actions_role_arn
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "github_actions" {
  cluster_name  = module.eks.cluster_name
  principal_arn = module.iam.github_actions_role_arn

  policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSEditPolicy"

  access_scope {
    type       = "namespace"
    namespaces = ["default"]
  }
}