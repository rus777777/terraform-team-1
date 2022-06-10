#region             = "us-east-1"           # declare as export variable TF_VAR_region
name_prefix      = "TerraformProject"
instance_type    = "t2.micro"
desired_capacity = 1
max_size         = 2
min_size         = 1
tags = {
  Name = "Terraform Project 1"
}

enable_ASG_in_public_subnets = false

#domain_name = "budaichiev.com"             # declare as export variable TF_VAR_domain_name
#db_name                = "wordpress"        # declare as export variable TF_VAR_db_name
#db_username            = "admin"            # declare as export variable TF_VAR_db_username
#db_password            = "xxxx"            # declare as export variable TF_VAR_db_password



