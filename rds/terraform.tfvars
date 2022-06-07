region              = "us-east-1"
allocated_storage   = 20
db_engine              = "mysql"
db_engine_version      = "5.7"
availability_zones  = local.az1
db_instance_class      = "db.t3.micro"
db_name             = "wordpress"
db_username     = "admin"
db_password = "bar"
publicly_accessible = true
number_of_instances = 1



domain = "zmileproperties.com"

# ZONEID = "Z00684521QJRR8IXV8VWM"

tags = {
  Name = "Terraform project"
}




