variable "region" {  
  description = "Please provide a region name"
  type        = string
  # declare as export variable TF_VAR_region
}
provider "aws" {
  region = var.region
}
resource "aws_key_pair" "packer" {
  key_name   = "packer_project_1"
  public_key = file("~/.ssh/id_rsa.pub")
}