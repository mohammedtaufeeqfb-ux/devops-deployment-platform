resource "aws_instance" "web_server" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  tags = merge(
  local.common_tags,
  {
    Name = local.common_name
  }
 )
}