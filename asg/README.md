# ASG for AWS
### This project will create Auto Scaling Group (ASG) a Three-Tier application on AWS.

## Table of Contents
```
```
1. [General info](https://docs.aws.amazon.com/autoscaling/ec2/userguide/auto-scaling-groups.html)

2. [Providers](https://github.com/rus777777/terraform-team-1/blob/main/asg/provider.tf)

3. [Usage](https://github.com/rus777777/terraform-team-1/blob/test/_release/main.tf)

3. [Variables](https://github.com/rus777777/terraform-team-1/blob/main/asg/variable.tf) / [Environment Variables](https://github.com/rus777777/terraform-team-1/blob/main/asg/example.tfvars)
4. [Packer](https://github.com/rus777777/terraform-team-1/blob/main/packer/README.md)


## General info
This repo create ASG that scales up to 3 replicas, based on the LB traffic. There will be at least 1 instance that host wordpress website that has static IP.

## Providers
Name                  | Version             |
--------------------- | --------------------|
  Terraform           | v1.1.1              |
  AWS                 | 4.17.1              |


## Usage

```
module "asg-t1" {
  source = "../asg"

  region      = var.region
  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
  domain_name = var.domain_name

  vpc_id                = module.vpc-t1.vpc_id
  private_subnet_name_1 = module.vpc-t1.private_subnet1
  private_subnet_name_2 = module.vpc-t1.private_subnet2
  private_subnet_name_3 = module.vpc-t1.private_subnet3
  public_subnet_name_1  = module.vpc-t1.public_subnet1
  public_subnet_name_2  = module.vpc-t1.public_subnet2
  public_subnet_name_3  = module.vpc-t1.public_subnet3

  name_prefix      = var.name_prefix
  instance_type    = var.instance_type
  desired_capacity = var.desired_capacity
  max_size         = var.max_size
  min_size         = var.min_size
  tags             = var.tags

  enable_ASG_in_public_subnets = var.enable_ASG_in_public_subnets
}
```
