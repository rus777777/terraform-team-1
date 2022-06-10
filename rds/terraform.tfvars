#region             = "us-east-1"           # declare as export variable TF_VAR_region
region                 = "us-east-1"
allocated_storage      = 20
engine                 = "mysql"
engine_version         = "5.7"
instance_class         = "db.t3.micro"

db_name                = "wordpress"
db_username            = "admin"

publicly_accessible    = false
number_of_instances    = 1
cluster_engine         = "aurora-mysql"
cluster_engine_version = "5.7.mysql_aurora.2.03.2"
cluster_instance_class = "db.t2.small"

#ZONEID                 = "Z0314190IVE0BV3G8215"
#domain_name            = "budaichiev.com" 

tags = {
  Name = "Terraform project"
}

#enable_RDS_in_public_subnets = false