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


variable "db_username" {
  type        = string
  default     = ""
  description = "Please provide a value"
}

variable "db_password" {
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
variable "subnet_ids" {
  description = "private and public subnet ids"
  type        = list(string)
  default     = []
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
variable "ZONEID" {
  type        = string
  default     = ""
  description = "Please provide a zone id"
}
variable "DOMAIN" {
  type        = string
  default     = ""
  description = "Please provide a zone id"
}
