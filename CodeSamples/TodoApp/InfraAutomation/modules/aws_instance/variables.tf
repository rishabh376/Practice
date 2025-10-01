variable "instance_type" {
  description = "The type of EC2 instance to create"
  default     = "t2.micro"
}

variable "ami" {
  description = "The AMI ID to use for the EC2 instance"
}

variable "key_name" {
  description = "The name of the key pair to use for SSH access"
}

variable "subnet_id" {
  description = "The ID of the subnet to launch the instance in"
}

variable "security_group_ids" {
  description = "The security group IDs to associate with the instance"
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to assign to the instance"
  type        = map(string)
  default     = {}
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}
