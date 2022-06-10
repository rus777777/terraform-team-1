# Terraform project: Team-1 - AWS

# Setup input parameters

Before building project set input variables!

* copy them to ~/.bashrc and reopen your terminal
* OR run them in CLI before run terraform command

They look like:
```
export TF_VAR_region=us-west-1
export PKR_VAR_region=$TF_VAR_region
export TF_VAR_domain_name=domain.com
export TF_VAR_db_name=wordpress
export TF_VAR_db_username=admin
export TF_VAR_db_password=Passw0RDforDataBase

```

# To build Project

Run command
```
bash build.sh
```
# To destroy project

Run command:
```
bash destroy.sh
```

## VPC group:

Module is published at Terraform Registry (https://registry.terraform.io/modules/rus777777/vpc-t1/aws/latest) :
```
module "vpc-t1" {
  source  = "rus777777/vpc-t1/aws"
  ...
}
```

Source code is in the
```
git@github.com:rus777777/terraform-aws-vpc-t1.git
```

- - -

# Project 

Project description

# Project goals (1 page)

* Project tasks:
  * create infrustructure architecture 
  * the size of the resources (could be parameterized)
  * determine dependencies between groups 
  * flexibility of the code
  * make regionless dependency
    * deploy into another region with a few clicks
    * resources should not depend on specific region

* Team communication:
  * How to negotatate with groups inside team
    * chat channel (telegram)
    * zoom
    * etc
  * which backends we use

# Org structure (1 page)

* Team leader
* VPC group
* RDS group
* ASG group

# Infrastructure architecture (1 page)

* Current infrastructure of our Project -  Anelia will share later

* create primitive model (prototype) of our project to negotiate beetwen groups

# VPC (1-3 pages)

* make base for other groups - RDS, ASG should not wait
* VPC organise as a Terraform mudule
* module published in Terraform Registry for public use

VPC
* 3 public subnets
* 3 private subnets
* 1 GW
* (depend on parameter) NAT GW 

# RDS 

* RDS instanse -  was created as simple model for testing connection
* Linked with our VPC
* DB/Login/Password is stored in env (also worked with Parameter Store - commented in code).
* RDS resides in private subnets, not accessible from Internet.
* Security Group is allow to access to port 3306
* using resources Aurora cluster
* publish in Route53:
  * writer.yourdomain.com
  * reader1.yourdomain.com
  * reader2.yourdomain.com
  * reader3.yourdomain.com

# ASG (1-3 pages)

* Launchned in our VPC
* Packer - for making golden image for ASG
  * code not depend on region - automative use our region
  * use Amazon Linux 2
* ASG template - automaticale choose latest golden image
  * use templatefile() for dynamic create file with needed parameters
* userdata
  * automative script to startup Wordpress and connect to DB

* ELB in public sunbets
* ASG in private subnets
* Security groups:
  * ELB accessable from Internet
  * ASG accessable from ALB

* wordpress is accessable through ALB by address <b>wordpress.yourdomain.com</b>


# Outputs / resume (1 page)

* we successfully made this project
  * flexibility of the code 
  * deploy into another region with a few clicks
  * expirience 3-tire architecture
  * undestood every stage of the project, correlation between groups 
  
* what we learn from this project 

* how many time (hours) team members contribute to project

- - -

# Helpful links:

Markdown Cheatsheet

https://github.com/tchapi/markdown-cheatsheet/blob/master/README.md


Reference architecture

https://docs.aws.amazon.com/whitepapers/latest/best-practices-wordpress/reference-architecture.html

- - -