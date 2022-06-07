resource "aws_security_group" "db" {
  name_prefix = "wordpress-db"
  vpc_id      = local.vpc_id

  # Your code goes here 

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  # Please do not change the code below
  tags = var.tags
}
