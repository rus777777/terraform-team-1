# region                 = "us-east-1"                    # declare as export variable TF_VAR_region
# domain_name            = "<your_domain_name>.com"       # declare as export variable TF_VAR_domain_name
# db_name                = "wordpress"                    # declare as export variable TF_VAR_db_name
# db_username            = "admin"                        # declare as export variable TF_VAR_db_username
# db_password            = "sdSDfdstSDF23vsfgdf"          # declare as export variable TF_VAR_db_password

# VPC variables

cidr_block         = "10.0.0.0/16"
public_subnet1     = "10.0.1.0/24"
public_subnet2     = "10.0.2.0/24"
public_subnet3     = "10.0.3.0/24"
private_subnet1    = "10.0.101.0/24"
private_subnet2    = "10.0.102.0/24"
private_subnet3    = "10.0.103.0/24"
enable_nat_gateway = true

tags = {
  Name = "Terraform project"
  Team = "Team 1"
}

# RDS variables

publicly_accessible    = false
number_of_instances    = 4                            # min 1 - for writer, if you need 3 readers set parameter to 4 
cluster_engine         = "aurora-mysql"
cluster_engine_version = "5.7.mysql_aurora.2.03.2"
cluster_instance_class = "db.t2.small"

# ASG variables

name_prefix                  = "TerraformProject"
instance_type                = "t2.micro"
desired_capacity             = 1
min_size                     = 1
max_size                     = 2
enable_ASG_in_public_subnets = false
