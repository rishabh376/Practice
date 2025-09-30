variable "db_instance_class" {
  description = "The instance type of the RDS database."
  type        = string
  default     = "db.t2.micro"
}

variable "db_engine" {
  description = "The database engine to use."
  type        = string
  default     = "postgres"
}

variable "db_name" {
  description = "The name of the database to create."
  type        = string
  default     = "tododb"
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

variable "vpc_security_group_ids" {
  description = "The VPC security group IDs to associate with the RDS instance."
  type        = list(string)
}

variable "db_subnet_group_name" {
  description = "The name of the DB subnet group."
  type        = string
}