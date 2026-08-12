resource "aws_eks_cluster" "main" {
  name     = "${var.project_name}-cluster"
  role_arn = var.cluster_role_arn

  access_config {
    authentication_mode                         = "API_AND_CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = true
  }

  vpc_config {
    subnet_ids = var.cluster_subnet_ids
  }
}

resource "aws_eks_node_group" "main" {

  cluster_name = aws_eks_cluster.main.name

  node_group_name = "${var.project_name}-node-group"

  node_role_arn = var.node_role_arn

  subnet_ids = var.node_subnet_ids

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

  instance_types = ["t3.small"]

  capacity_type = "ON_DEMAND"
}