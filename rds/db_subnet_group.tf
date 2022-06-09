resource "aws_db_subnet_group" "this" {
  name       = "main"
  subnet_ids = [local.ps1, local.ps2, local.ps3]
  tags       = var.tags
}