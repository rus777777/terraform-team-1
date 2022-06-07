region              = "us-east-1"
allocated_storage   = 20
engine              = "mysql"
engine_version      = "5.7"
#availability_zones  = ["us-east-1a","us-east-1b", "us-east-1c"] 
instance_class      = "db.t3.micro"
db_name             = "wordpress"
username     = "admin"
publicly_accessible = true

# master_password = "bar"

domain = "zmileproperties.com"

# ZONEID = "Z00684521QJRR8IXV8VWM"

tags = {
  Name = "Terraform project"
}




