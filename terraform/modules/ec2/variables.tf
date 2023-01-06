# Tagging system
variable "tags" {
  description = "Map of mass assign tags to all resources"
  type        = map(string)
}
variable "resource_specific_tags" {
  description = "Map of tags to assign to specific resources supporting tags. Merged with `tags`."
  type        = map(map(string))

  default = {}
}

# VPC
variable "subnet_id" {
  description = "Id of subnet to connect to"
  type        = string
}
variable "vpc_security_group_ids" {
  description = "Id of VPC security group"
  type        = string
}

# Key Pair
variable "aws_key_pair_name" {
  description = "Key pair name"
  type        = string
}