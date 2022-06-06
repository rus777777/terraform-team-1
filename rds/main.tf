#  Example how to use VPC backend
#
# data "terraform_remote_state" "vpc" {
#   backend = "s3"
#   config = {
#  
#     # change backet name to  terraform-tfstate-<YOUR-NAME>:
#     # like
#     # bucket = terraform-tfstate-rus 
#     # OR use this variable 
#     bucket = var.vpc_bucket
#
#     key    = "project-team-1/dev/vpc"
#     region = "us-east-1"
#   }
# }
#
# output "vpc_id" {
#   value = data.terraform_remote_state.vpc.outputs.vpc_id
# }

resource "random_password" "password" {
  length           = 20
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_ssm_parameter" "dbpass" {
  name  = var.db_name
  type  = "SecureString"
  value = random_password.password.result
}

resource "aws_db_instance" "default" {
  allocated_storage      = var.allocated_storage
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  username               = var.username
  db_name                = var.db_name
  password               = random_password.password.result
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  publicly_accessible    = var.publicly_accessible
  vpc_security_group_ids = [aws_security_group.db.id]

  tags = var.tags
}

