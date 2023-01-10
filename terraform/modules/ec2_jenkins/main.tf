# Security Group
resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins_sg_djauregui"
  description = "Allow Jenkins Traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow from Personal CIDR block"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH from Personal CIDR block"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    lookup(var.resource_specific_tags, "ec2_jenkins", {}),
    {
      ExtraInformation = "Jenkins SG"
    }
  )
}

# AMI
data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  owners = ["amazon"] # Canonical
}

# Script
data "template_file" "install_jenkins" {
  template = file("${path.module}/install_jenkins.sh")
}

# Instance
resource "aws_instance" "web" {
  ami               = data.aws_ami.amazon_linux.id
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  key_name          = var.aws_key_pair_name

  # Jenkins script
  user_data = data.template_file.install_jenkins.rendered

  subnet_id                   = var.subnet_id
  security_groups             = [aws_security_group.jenkins_sg.id]
  associate_public_ip_address = true

  tags = merge(
    var.tags,
    lookup(var.resource_specific_tags, "ec2_jenkins", {})
  )

  depends_on = [
    aws_security_group.jenkins_sg
  ]
}