
resource "aws_security_group" "db_security" {
  name_prefix = "db-secgroup"
  vpc_id      = local.vpc_id

  # Your code goes here 

  ingress {
    description = "MySQL"
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
