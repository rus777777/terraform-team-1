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