
resource "aws_security_group" "db" {
  name_prefix = "wordpress-sg"
  description = " Allow ssh and http from the VPC components to the instance "
  vpc_id      = local.vpc_id

  # Your code goes here 

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  } 

  # Please do not change the code below
  tags = var.tags
}
