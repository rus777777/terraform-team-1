locals {
  writer = (element(aws_rds_cluster_instance.wordpress_cluster_instance.*.writer, 0) == true ?
    element(aws_rds_cluster_instance.wordpress_cluster_instance.*.endpoint, 0) :
    (element(aws_rds_cluster_instance.wordpress_cluster_instance.*.writer, 1) == true ?
      element(aws_rds_cluster_instance.wordpress_cluster_instance.*.endpoint, 1) :
      (element(aws_rds_cluster_instance.wordpress_cluster_instance.*.writer, 2) == true ?
        element(aws_rds_cluster_instance.wordpress_cluster_instance.*.endpoint, 2) :
  element(aws_rds_cluster_instance.wordpress_cluster_instance.*.endpoint, 3))))

  all_instances = tolist(aws_rds_cluster_instance.wordpress_cluster_instance.*.endpoint)
  reader_instances = toset([
    for x in local.all_instances :
    x if x != local.writer
  ])
}
resource "aws_route53_record" "writer" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = "writer.${var.domain_name}"
  type    = "CNAME"
  ttl     = "300"
  records = [local.writer]
}
resource "aws_route53_record" "readers" {
  count   = var.number_of_instances - 1
  
  zone_id = data.aws_route53_zone.this.zone_id
  name    = "reader${count.index + 1}.${var.domain_name}"
  type    = "CNAME"
  ttl     = "300"
  records = [element(local.reader_instances[*], count.index)]
}

data "aws_route53_zone" "this" {
  name         = var.domain_name
  private_zone = false
}


