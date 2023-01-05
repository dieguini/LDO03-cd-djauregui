variable "ec2_name" {
  description = "Name of EC2 instance to be applied"
  type        = string
  default     = ""
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