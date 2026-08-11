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

  project_name = var.project_name

  subnet_ids = module.networking.private_subnet_ids

  cluster_role_arn = module.iam.eks_cluster_role_arn
}