variable "environment" {
  description = "Name of envaremnets"
  type        = string
  default     = ""
}

variable "prefix" {
  description = "global prefix"
  type        = "string"
  default     = "test"
}

variable "region" {
  description = "region"
  type        = "string"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}