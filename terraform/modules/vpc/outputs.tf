output "aws_vpc_id" {
  value = aws_vpc.this.id
}

output "aws_subnet_public_id" {
  value = aws_subnet.public.id
}

output "aws_subnet_private_id" {
  value = aws_subnet.private.id
}

output "aws_security_group_web_sg_id" {
  value = aws_security_group.web_sg.id
}