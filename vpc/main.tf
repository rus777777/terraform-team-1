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

resource "aws_key_pair" "packer" {
  key_name   = "packer_project_1"
  public_key = file("~/.ssh/id_rsa.pub")
  tags = var.tags
}
