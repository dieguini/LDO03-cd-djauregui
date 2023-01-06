# LDO03-ci-djauregui

Terraform own module:

- [ec2](terraform/modules/ec2/)
- [key_pair](terraform/modules/key_pair/)
- [vpc](terraform/modules/vpc/)

This modules are used to create a VPC, Share a Public KMS Key and EC2 that attachs

## Usage
---

Using terraform commands

```sh
terraform init
terraform plan -out main.tfplan
terraform apply main.tfplan
```

## Requirements
---

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 4.48.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.73 |

## Providers
---

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.73 |
