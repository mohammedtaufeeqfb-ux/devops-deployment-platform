output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "vpc_id" {
  value = module.networking.vpc_id
}

output "ecr_repository_url" {
  value = module.ecr.repository_url
}