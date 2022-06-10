
# output "address" {
#   # Your code goes here 
#   value = aws_db_instance.this.address
# }
# output "availability_zone" {
#   # Your code goes here 
#   value = aws_db_instance.this.availability_zone
# }
# output "engine" {
#   # Your code goes here 
#   value = aws_db_instance.this.engine
# }
# output "id" {
#   # Your code goes here 
#   value = aws_db_instance.this.id
# }
# output "port" {
#   # Your code goes here 
#   value = aws_db_instance.this.port
# }
# output "name" {
#   # Your code goes here 
#   value = aws_db_instance.this.name
# }

output "username" {
  value = var.db_username
}
output "cluster_endpoint" {
  value = aws_rds_cluster.wordpress_db_cluster.endpoint
}
output "depends_on" {
  value = aws_rds_cluster_instance.wordpress_cluster_instance[*].id
}
output "address" {
  value = aws_route53_record.writer.name
}
output "writer_53" {
  value = aws_route53_record.writer.name
}
output "readers_53" {
  value = aws_route53_record.readers.*.name
}