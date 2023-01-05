variable "aws_key_pair_name" {
  description = "AWS Key Pair Name"
  type        = string
}

variable "aws_key_pair_public_key" {
  description = "AWS Key Public Key"
  type        = string
}

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