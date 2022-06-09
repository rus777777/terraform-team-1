# # data "terraform_remote_state" "asg" {
# #   backend = "s3"
# #   config = {
# #     # you shoud have S3 backet with name: terraform-tfstate-<Account_ID> 
# #     bucket = "terraform-tfstate-${local.account_id}"
# #     key    = "project-team-1/dev/asg"
# #     region = "us-east-1"
# #   }
# # }

# locals {
#   writer = (element(aws_rds_cluster_instance.wordpress_cluster_instance.*.writer, 0) == true ?
#     element(aws_rds_cluster_instance.wordpress_cluster_instance.*.endpoint, 0) :
#     (element(aws_rds_cluster_instance.wordpress_cluster_instance.*.writer, 1) == true ?
#       element(aws_rds_cluster_instance.wordpress_cluster_instance.*.endpoint, 1) :
#       (element(aws_rds_cluster_instance.wordpress_cluster_instance.*.writer, 2) == true ?
#         element(aws_rds_cluster_instance.wordpress_cluster_instance.*.endpoint, 2) :
#   element(aws_rds_cluster_instance.wordpress_cluster_instance.*.endpoint, 3))))

#   all_instances = tolist(aws_rds_cluster_instance.wordpress_cluster_instance.*.endpoint)
#   reader_instances = toset([
#     for x in local.all_instances :
#     x if x != local.writer
#   ])
# }
# resource "aws_route53_record" "writer" {
#   zone_id = var.ZONEID
#   name    = "writer.${var.DOMAIN}"
#   type    = "CNAME"
#   ttl     = "300"
#   records = [local.writer]
# }
# resource "aws_route53_record" "readers" {
#   count   = var.number_of_instances - 1
#   zone_id = var.ZONEID
#   name    = "reader${count.index + 1}.${var.DOMAIN}"
#   type    = "CNAME"
#   ttl     = "300"
#   records = [element(local.reader_instances[*], count.index)]
# }

# data "aws_route53_zone" "this" {
#   name         = var.DOMAIN
#   private_zone = false
# }
