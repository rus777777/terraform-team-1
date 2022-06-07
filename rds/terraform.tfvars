region              = "us-east-1"
allocated_storage   = 20
engine              = "aurora-mysql"
engine_version      = "5.7.mysql_aurora.2.03.2"
availability_zones  = ["us-east-1a","us-east-1b", "us-east-1c"] 
instance_class      = "db.t3.micro"
db_name             = "wordpress"
master_username     = "admin"
master_password = "bar"
publicly_accessible = true
domain = "zmileproperties.com"

tags = {
  Name = "Terraform project"
}