variable "region" {
  description = "Please provide a region name"
  type        = string
}
variable "tags" {
  description = "Please provide a tag for resources"
  type        = map(any)
  default     = {}
}

variable "allocated_storage" {
  type        = string
  default     = ""
  description = "Please provide a value"
}

variable "engine" {
  type        = string
  default     = ""
  description = "Please provide a value"
}

variable "engine_version" {
  type        = string
  default     = ""
  description = "Please provide a value"
}

variable "instance_class" {
  type        = string
  default     = ""
  description = "Please provide a value"
}

variable "db_name" {
  type        = string
  default     = ""
  description = "Please provide a value"
}


variable "username" {
  type        = string
  default     = ""
  description = "Please provide a value"
}

variable "password" {
  type        = string
  default     = ""
  description = "Please provide a value"
}


variable "publicly_accessible" {
  type        = string
  default     = ""
  description = "Please provide a value"
}

variable "vpc_bucket" {
  type        = string
  default     = ""
  description = "Please provide name of the VPC backend in next format terraform-tfstate-<YOUR-NAME>"
}

variable "enable_RDS_in_public_subnets" {
  type        = bool
  default     = true
  description = "Enable RDS in public subnets"
}
