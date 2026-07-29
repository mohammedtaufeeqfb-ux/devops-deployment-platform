resource "aws_instance" "web_server" {
  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = var.instance_type

  tags = merge(
  local.common_tags,
  {
    Name = local.common_name
  }
 )
}