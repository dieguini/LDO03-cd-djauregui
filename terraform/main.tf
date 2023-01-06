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
module "vpc" {
  source = "./modules/vpc"

  # Variables

  # Tagging system
  tags                   = var.tags
  resource_specific_tags = var.resource_specific_tags
}

module "key_pair" {
  source = "./modules/key_pair"

  # Variables
  aws_key_pair_name       = var.kms.aws_key_pair_name
  aws_key_pair_public_key = var.kms.aws_key_pair_public_key

  # Tagging system
  tags                   = var.tags
  resource_specific_tags = var.resource_specific_tags
}

module "ec2_amazon_linux" {
  source = "./modules/ec2"

  # Variables
  subnet_id              = module.vpc.aws_subnet_public_id
  vpc_security_group_ids = module.vpc.aws_security_group_web_sg_id
  aws_key_pair_name      = module.key_pair.aws_key_pair_key_name

  # Tagging system
  tags                   = var.tags
  resource_specific_tags = var.resource_specific_tags

  depends_on = [
    module.vpc, module.key_pair
  ]
}