variable "role_name" {
  description = "The name of the IAM role"
  type        = string
}

variable "assume_role_policy" {
  description = "The assume role policy document for the IAM role"
  type        = string
}

variable "permissions_boundary" {
  description = "The ARN of the permissions boundary for the IAM role"
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to the IAM role"
  type        = map(string)
  default     = {}
}

variable "policy_name" {}
  
