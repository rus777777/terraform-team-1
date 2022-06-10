module "vpc-t1" {
  source = "rus777777/vpc-t1/aws"

  region          = var.region
  cidr_block      = var.cidr_block
  public_subnet1  = var.public_subnet1
  public_subnet2  = var.public_subnet2
  public_subnet3  = var.public_subnet3
  private_subnet1 = var.private_subnet1
  private_subnet2 = var.private_subnet2
  private_subnet3 = var.private_subnet3

  enable_nat_gateway = var.enable_nat_gateway

  tags = var.tags
}

# Remind! Create Packer image for ASG

module "rds-t1" {
  source = "../rds"

  region      = var.region
  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
  domain_name = var.domain_name

  vpc_id                = module.vpc-t1.vpc_id
  private_subnet_name_1 = module.vpc-t1.private_subnet1
  private_subnet_name_2 = module.vpc-t1.private_subnet2
  private_subnet_name_3 = module.vpc-t1.private_subnet3

  publicly_accessible    = var.publicly_accessible
  number_of_instances    = var.number_of_instances
  cluster_engine         = var.cluster_engine
  cluster_engine_version = var.cluster_engine_version
  cluster_instance_class = var.cluster_instance_class

  tags = var.tags
}

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