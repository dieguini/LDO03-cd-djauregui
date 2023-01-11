# Security Group
resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins_sg_djauregui"
  description = "Allow Traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow Jenkins Port"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow WeebHook"
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Any traffic"
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

# Scripts
## Jenkins
data "template_file" "install_jenkins" {
  template = file("${path.module}/scripts/install_jenkins.sh")
}
## Git
data "template_file" "install_git" {
  template = file("${path.module}/scripts/install_git.sh")
}
## Docker
data "template_file" "install_docker" {
  template = file("${path.module}/scripts/install_docker.sh")
}
## Maven
data "template_file" "install_mvn" {
  template = file("${path.module}/scripts/install_mvn.sh")
}
## Go
data "template_file" "install_go" {
  template = file("${path.module}/scripts/install_go.sh")
}

# Instance
resource "aws_instance" "web" {
  ami               = data.aws_ami.amazon_linux.id
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  key_name          = var.aws_key_pair_name

  # Scripts
  # user_data = data.template_file.install_jenkins.rendered
  user_data = join(
    "\n",[
      data.template_file.install_jenkins.rendered,
      data.template_file.install_git.rendered,
      data.template_file.install_docker.rendered,
      data.template_file.install_mvn.rendered,
      data.template_file.install_go.rendered,
    ])

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

# EBS Volume (To Persist Jenkins Data)
/* resource "aws_ebs_volume" "jenkins_data" {
  availability_zone = aws_instance.web.availability_zone
  size              = 16

  lifecycle {
    prevent_destroy = true
  }

  tags = merge(
    var.tags,
    lookup(var.resource_specific_tags, "ec2_jenkins", {}),
    {
      ExtraInformation = "Jenkins EBS Volume"
    }
  )

  depends_on = [
    aws_instance.web
  ]
} */

resource "aws_volume_attachment" "jenkins_data_attachment" {
  device_name  = "/dev/sda1"
  # volume_id    = aws_ebs_volume.jenkins_data.id
  volume_id    = "vol-01f91697ca38bf024"
  instance_id  = aws_instance.web.id

  depends_on = [
    # aws_ebs_volume.jenkins_data,
    aws_instance.web
  ]
}
