#region             = "us-east-1"           # declare as export variable TF_VAR_region

allocated_storage = 20
engine            = "mysql"
engine_version    = "5.7"
instance_class    = "db.t3.micro"

#db_name                = "wordpress"        # declare as export variable TF_VAR_db_name
#db_username            = "admin"            # declare as export variable TF_VAR_db_username
#db_password            = ""                 # declare as export variable TF_VAR_db_password

publicly_accessible    = false
number_of_instances    = 1 # min 1 - for writer, > 1 - will create readers
cluster_engine         = "aurora-mysql"
cluster_engine_version = "5.7.mysql_aurora.2.03.2"
cluster_instance_class = "db.t2.small"
tags = {
  Name = "Terraform project"
}



#domain_name            = "budaichiev.com"             # declare as export variable TF_VAR_domain_name


