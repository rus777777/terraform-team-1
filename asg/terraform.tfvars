region           = "us-east-1"
name_prefix      = "TerraformProject"
instance_type    = "t2.micro"
desired_capacity = 1
max_size         = 99
min_size         = 1
tags = {
  Name = "Terraform Project 1"
}
domain_name = "budaichiev.com"