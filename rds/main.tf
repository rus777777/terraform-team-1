# read data from created VPC
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    # you shoud have S3 backet with name: terraform-tfstate-<Account_ID> 
    bucket = "terraform-tfstate-${local.account_id}"

    key    = "project-team-1/dev/vpc"
    region = "us-east-1"
  }
}

data "aws_caller_identity" "current" {}
locals {
  account_id = data.aws_caller_identity.current.account_id
  vpc_id     = data.terraform_remote_state.vpc.outputs.vpc_id

  # ps1        = data.terraform_remote_state.vpc.outputs.public_subnet1
  # ps2        = data.terraform_remote_state.vpc.outputs.public_subnet2
  # ps3        = data.terraform_remote_state.vpc.outputs.public_subnet3

  pr1        = data.terraform_remote_state.vpc.outputs.private_subnet1
  pr2        = data.terraform_remote_state.vpc.outputs.private_subnet2
  pr3        = data.terraform_remote_state.vpc.outputs.private_subnet3

  # az1        = data.terraform_remote_state.vpc.outputs.az1
  # az2        = data.terraform_remote_state.vpc.outputs.az2
  # az3        = data.terraform_remote_state.vpc.outputs.az3
}

resource "random_password" "password" {
  length           = 20
  special          = false
}

resource "aws_ssm_parameter" "db_username" {
  name  = var.db_username
  type  = "SecureString"
  value = random_password.password.result
}

# resource "aws_db_instance" "this" {
#   allocated_storage      = var.allocated_storage
#   engine                 = var.engine
#   engine_version         = var.engine_version
#   instance_class         = var.instance_class
#   username               = aws_ssm_parameter.db_username.name
#   db_name                = var.db_name
#   password               = random_password.password.result
#   parameter_group_name   = "default.mysql5.7"
#   skip_final_snapshot    = true
#   publicly_accessible    = var.publicly_accessible
#   vpc_security_group_ids = [aws_security_group.db.id]
#   availability_zone      = local.az1
#   db_subnet_group_name   = aws_db_subnet_group.this.id
#   tags                   = var.tags
# }

resource "aws_db_subnet_group" "this" {
  name       = "main"
  subnet_ids = [local.pr1, local.pr2, local.pr3]
  tags       = var.tags
}
