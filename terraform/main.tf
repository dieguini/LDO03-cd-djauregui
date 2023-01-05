terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.48.0"
    }
  }
}

################################################################################
# Calling Modules
################################################################################
module "ec2_amazon_linux" {
  source = "./modules/ec2"

  ec2_name = var.ec2_variables.name

  tags                   = var.tags
  resource_specific_tags = var.resource_specific_tags
}