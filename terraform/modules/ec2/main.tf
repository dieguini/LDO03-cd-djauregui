# Ami
data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  owners = ["amazon"]
}

# Aws Instance
resource "aws_instance" "this" {
  ami               = data.aws_ami.amazon_linux.id
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  key_name          = var.aws_key_pair_name

  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.vpc_security_group_ids]
  associate_public_ip_address = true

  tags = merge(
    var.tags,
    lookup(var.resource_specific_tags, "ec2_amazon_linux", {})
  )
}
