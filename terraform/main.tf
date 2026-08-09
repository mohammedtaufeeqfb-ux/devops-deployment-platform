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

  project_name = var.project_name

  subnet_id = module.networking.public_subnet_a_id

  security_group_id = module.security.security_group_id

  instance_profile_name = module.iam.instance_profile_name
}