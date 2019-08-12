variable "environment" {
  description = "Name of envaremnets"
  type        = string
  default     = ""
}

variable "name" {
  description = "Name"
  type        = string
}

variable "policy_attachment" {
  description = "arns of policys for attachment to role"
  type        = "list"
  default     = []
}
variable "prefix" {
  description = "global prefix for alb"
  type        = "string"
  default     = "pronto"
}

variable "region" {
  description = "region for s3 buckets"
  type        = "string"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}