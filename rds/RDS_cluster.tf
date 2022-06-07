resource "aws_rds_cluster" "wordpress_db_cluster" {
  cluster_identifier      = "wordpress-cluster"
  engine                  = var.db_engine
  engine_version          = var.db_engine_version
  availability_zones      = var.availability_zones
  database_name           = aws_ssm_parameter.db_name.value
  master_username         = aws_ssm_parameter.db_username.value
  master_password         = aws_ssm_parameter.db_password.value
  db_subnet_group_name    = aws_db_subnet_group.wordpress_db_subnet.name
  vpc_security_group_ids  = [aws_security_group.db.id]
  backup_retention_period = 5
  storage_encrypted       = true
}
resource "aws_rds_cluster_instance" "wordpress_cluster_instance" {
  depends_depends_on   = [aws_rds_cluster.wordpress_db_cluster]
  apply_immediately    = true
  promotion_tier       = count.index
  count                = var.number_of_instances
  identifier           = "wordpress-cluster-instance-${format(count.index + 1)}"
  cluster_identifier   = aws_rds_cluster.wordpress_db_cluster.id
  instance_class       = var.db_instance_class
  engine               = aws_rds_cluster.wordpress_db_cluster.engine
  engine_version       = aws_rds_cluster.wordpress_db_cluster.engine_version
  publicly_accessible  = true
  db_subnet_group_name = aws_rds_cluster.wordpress_db_cluster.db_subnet_group_name
}

