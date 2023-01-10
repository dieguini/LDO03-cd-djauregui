# Context
context_vars = {
  "aws_region" = "us-east-1"
}

# EC2 Variables

# KMS
kms = {
  "aws_key_pair_name"       = "kms-cd-djauregui"
  "aws_key_pair_public_key" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDQ6LWvPEmOKAbor3C/oR8wODBSQ6oeBcJ24Jt0zKMuoPC6b/cm1i5CFE+xlCb7FC/alau3i1sW3oLZePrGpVjf5Rx6fjD91B2xdRZP+2d8NZHNGcDMQnTTu9FrrmtDY6x70rtrw9anWF4TIH2MZJaq4b8Kf5Sthde/1EA1G3gZl8jgeEeQrnfnVqFPhIaI6LhxYhWP4UIH5Avb+xfXP+gC1eBVynJX1gICWE0nbC1p88lBPe54fVtxcn/INTQrDJhb5MNL5wl1xUIfFOfxOqKowaZYTSkjycsJtIVFq42bQBwbbEaiO75Y+jSm7owXnNjse4oQMUF1vDZRdoj65sIl0qZdui9b5ds+NEDYOsf6bj4gF7PgScYOoObFWUtEdlRFZ4ZnuE0ufoKnKaQPvRZMUdHFxfvM2cFCIdZsHpNLPNcBIPa5q1Zofuizy9M7ZMUi5hEoglZ0Ft3JMoCefA716r63vvQCEYGQte8Jye+8J+/REK4cNlH51R9Zby3l+98= diego@djauregui-aw"
}

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
  "vpc" = {
    "Name" = "vpc-cd-djauregui"
  }
  "ec2_jenkins" = {
    "Name" = "ec2-cd-jenkins-djauregui"
  }
}