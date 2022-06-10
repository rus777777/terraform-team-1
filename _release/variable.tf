variable "cidr_block" {
  description = "Please provide CIDR block for VPC"
  type        = string
  default     = ""
}
variable "region" {
  description = "Please provide a region name"
  type        = string
}
variable "tags" {
  description = "Please provide a tag for resources"
  type        = map(any)
  default     = {}
}
variable "public_subnet1" {
  description = "Please provide subnet CIDR block"
  type        = string
  default     = ""
}
variable "public_subnet2" {
  description = "Please provide subnet CIDR block"
  type        = string
  default     = ""
}
variable "public_subnet3" {
  description = "Please provide subnet CIDR block"
  type        = string
  default     = ""
}

variable "private_subnet1" {
  description = "Please provide subnet CIDR block"
  type        = string
  default     = ""
}
variable "private_subnet2" {
  description = "Please provide subnet CIDR block"
  type        = string
  default     = ""
}
variable "private_subnet3" {
  description = "Please provide subnet CIDR block"
  type        = string
  default     = ""
}

variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  type        = bool
  default     = false
}

# RDS variables


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
  description = "Please provide DB name"
}
variable "db_username" {
  type        = string
  default     = ""
  description = "Please provide DB username"
}
variable "db_password" {
  type        = string
  default     = ""
  description = "Please provide DB password"
}
variable "publicly_accessible" {
  type        = string
  default     = ""
  description = "Please provide a value"
}
variable "number_of_instances" {
  type        = string
  default     = ""
  description = "Please provide a domain"
}
variable "cluster_engine" {
  type        = string
  default     = ""
  description = "Please provide a value"
}
variable "cluster_engine_version" {
  type        = string
  default     = ""
  description = "Please provide a value"
}
variable "cluster_instance_class" {
  type        = string
  default     = ""
  description = "Please provide a value"
}
variable "domain_name" {
  type        = string
  default     = ""
  description = "Please provide a zone id"
}

# ASG variables

variable "name_prefix" {
  description = "Provide a value"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "Provide a value"
  type        = string
  default     = ""
}

variable "desired_capacity" {
  description = "Provide a value"
  type        = string
  default     = ""
}

variable "max_size" {
  description = "Provide a value"
  type        = string
  default     = ""
}

variable "min_size" {
  description = "Provide a value"
  type        = string
  default     = ""
}

variable "enable_ASG_in_public_subnets" {
  type        = bool
  default     = true
  description = "Enable launch ASG instances in public subnets"
}