#region             = "us-east-1"           # declare as export variable TF_VAR_region
allocated_storage   = 20
engine              = "mysql"
engine_version      = "5.7"
instance_class      = "db.t3.micro"
db_name             = "wordpress"
username            = "admin"
publicly_accessible = false


tags = {
  Name = "Terraform project"
}

enable_RDS_in_public_subnets = false