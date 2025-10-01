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

variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ."
  type        = bool
  default     = false
}
variable "backup_retention_period" {
  description = "The days to retain backups for."
  type        = number
  default     = 7
}
variable "subnet_ids" {
  description = "A list of subnet IDs for the DB subnet group."
  type        = list(string)
}
variable "vpc_id" {
  description = "The VPC ID where the RDS instance will be deployed."
  type        = string
}
variable "allowed_cidrs" {
  description = "A list of CIDR blocks allowed to access the RDS instance."
  type        = list(string)
  default     = ["10.0.1.0/24"]
  }

variable "storage_type" {
  description = "The storage type to use (e.g., gp2, io1, standard)."
  type        = string
  default     = "gp2"
}

variable "engine_version" {
  description = "The version of the database engine."
  type        = string
  default     = "13.4"
}

variable "instance_class" {
  description = "The instance class of the RDS database."
  type        = string
  default     = "db.t3.micro"
}
variable "username" {
  description = "The username for the database."
  type        = string
}
variable "password" {
  description = "The password for the database."
  type        = string
  sensitive   = true
}
variable "engine" {
  description = "The database engine to use."
  type        = string
  default     = "postgres"
}

