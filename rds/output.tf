
output "address" {
  # Your code goes here 
  value = aws_db_instance.this.address
}
output "availability_zone" {
  # Your code goes here 
  value = aws_db_instance.this.availability_zone
}
output "engine" {
  # Your code goes here 
  value = aws_db_instance.this.engine
}
output "id" {
  # Your code goes here 
  value = aws_db_instance.this.id
}
output "port" {
  # Your code goes here 
  value = aws_db_instance.this.port
}
output "name" {
  # Your code goes here 
  value = aws_db_instance.this.name
}
output "username" {
  value = var.db_username
}