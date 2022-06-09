resource "aws_rds_cluster" "wordpress_db_cluster" {
  cluster_identifier      = "wordpress-cluster"
  engine                  = var.cluster_engine
  engine_version          = var.cluster_engine_version
  enable_http_endpoint    = true
  database_name           = aws_db_instance.this.name
  master_username         = aws_db_instance.this.username
  master_password         = aws_db_instance.this.password
  skip_final_snapshot     = true
  db_subnet_group_name    = aws_db_subnet_group.this.id
  vpc_security_group_ids  = [aws_security_group.db.id]
  backup_retention_period = 5
  storage_encrypted       = true
}
resource "aws_rds_cluster_instance" "wordpress_cluster_instance" {
  depends_on          = [aws_rds_cluster.wordpress_db_cluster]
  apply_immediately   = true
  promotion_tier      = count.index
  count               = var.number_of_instances
  identifier          = "wordpress-cluster-instance${format(count.index + 1)}"
  cluster_identifier  = aws_rds_cluster.wordpress_db_cluster.id
  instance_class      = var.cluster_instance_class
  engine              = aws_rds_cluster.wordpress_db_cluster.engine
  engine_version      = aws_rds_cluster.wordpress_db_cluster.engine_version
  publicly_accessible = true

}