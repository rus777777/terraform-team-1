#region             = "us-east-1"           # declare as export variable TF_VAR_region
name_prefix      = "TerraformProject"
instance_type    = "t2.micro"
desired_capacity = 1
max_size         = 2
min_size         = 1
tags = {
  Name = "Terraform Project 1"
}
#domain_name = "budaichiev.com"             # declare as export variable TF_VAR_domain_name

#enable_ASG_in_public_subnets = false

