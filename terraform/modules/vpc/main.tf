# VPC
resource "aws_vpc" "this" {
  cidr_block = "172.16.0.0/16"

  tags = merge(
    var.tags,
    lookup(var.resource_specific_tags, "vpc", {})
  )
}

# Subnets
## Public
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-1a"

  tags = merge(
    var.tags,
    lookup(var.resource_specific_tags, "vpc", {}),
    {
      ExtraInformation = "public_subnet"
    }
  )
}

## Private
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "172.16.20.0/24"
  availability_zone = "us-east-1b"

  tags = merge(
    var.tags,
    lookup(var.resource_specific_tags, "vpc", {}),
    {
      ExtraInformation = "private_subnet"
    }
  )
}

# Internet Gateway
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.this.id

  tags = merge(
    var.tags,
    lookup(var.resource_specific_tags, "vpc", {})
  )
}

# Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }

  tags = merge(
    var.tags,
    lookup(var.resource_specific_tags, "vpc", {})
  )
}

# Route Table Association
resource "aws_route_table_association" "public_1_rt_a" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

# Security Group
/* resource "aws_security_group" "web_sg" {
  name   = "HTTP & SSH"
  vpc_id = aws_vpc.this.id

  ingress {
    description = "Allow from Personal CIDR block"
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
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
} */
