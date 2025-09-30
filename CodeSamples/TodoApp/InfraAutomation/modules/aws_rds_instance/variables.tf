variable "db_instance_class" {
  description = "The instance type of the RDS database."
  type        = string
  default     = "db.t2.micro"
}

variable "db_name" {
  description = "The name of the database to create."
  type        = string
}

variable "db_username" {
  description = "The username for the database."
  type        = string
}

variable "db_password" {
  description = "The password for the database."
  type        = string
  sensitive   = true
}

variable "allocated_storage" {
  description = "The allocated storage for the database (in GB)."
  type        = number
  default     = 20
}

variable "engine" {
  description = "The database engine to use."
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "The version of the database engine to use."
  type        = string
  default     = "8.0"
}

variable "vpc_security_group_ids" {
  description = "The VPC security group IDs to associate with the RDS instance."
  type        = list(string)
}

variable "subnet_ids" {
  description = "The subnet IDs to launch the RDS instance in."
  type        = list(string)
}

variable "storage_type" {
  description = "The storage type to use for the RDS instance."
  type        = string
}

variable "instance_class" {
  description = "The instance class to use for the RDS instance."
  type        = string  
}

variable "username" {
  description = "The master username for the RDS instance."
  type        = string  
}

variable "password" {
  description = "The master password for the RDS instance."
  type        = string  
  sensitive   = true
}

variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ."
  type        = bool
  default     = false
}

variable "backup_retention_period" {
  description = "The days to retain backups for the RDS instance."
  type        = number
  default     = 7
}
variable "vpc_id" {
  description = "The VPC ID where the RDS instance will be deployed."
  type        = string
}

variable "allowed_cidrs" {
  description = "A list of CIDR blocks allowed to access the RDS instance."
  type        = list(string)
}