# Context
context_vars = {
  "aws_region" = "us-east-1"
}

# EC2 Variables

# Tagging system
tags = {
  "Bootcamp"    = "JU BC LAT DEVOPS 01",
  "CreatedWith" = "terraform",
  "Owner"       = "Diego Jauregui S"
}
resource_specific_tags = {
  "ec2_amazon_linux" = {
    "Name" = "ec2-cd-djauregui"
  }
}