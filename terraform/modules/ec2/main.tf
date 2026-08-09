resource "aws_instance" "app_server" {

  ami = "ami-0f58b397bc5c1f2e8"

  instance_type = "t2.micro"

  subnet_id = var.subnet_id

  vpc_security_group_ids = [
    var.security_group_id
  ]

  iam_instance_profile = var.instance_profile_name

  associate_public_ip_address = true

  tags = {
    Name = "${var.project_name}-server"
  }
}