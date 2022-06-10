data "aws_caller_identity" "current" {}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    # you shoud have S3 backet with name: terraform-tfstate-<Account_ID> 
    bucket = "terraform-tfstate-${local.account_id}"
    key    = "project-team-1/dev/vpc"
    region = "us-east-1"
  }
}

data "aws_ami" "this" {
  most_recent = true
  owners      = [local.account_id]

  filter {
    name   = "name"
    values = ["golden-image-project-1-*"]
  }
}

locals {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  ps1    = data.terraform_remote_state.vpc.outputs.public_subnet1
  ps2    = data.terraform_remote_state.vpc.outputs.public_subnet2
  ps3    = data.terraform_remote_state.vpc.outputs.public_subnet3

  pr1 = data.terraform_remote_state.vpc.outputs.private_subnet1
  pr2 = data.terraform_remote_state.vpc.outputs.private_subnet2
  pr3 = data.terraform_remote_state.vpc.outputs.private_subnet3

  az1 = data.terraform_remote_state.vpc.outputs.az1
  az2 = data.terraform_remote_state.vpc.outputs.az2
  az3 = data.terraform_remote_state.vpc.outputs.az3

  account_id = data.aws_caller_identity.current.account_id
  ami_id     = data.aws_ami.this.image_id

  db_name = var.db_name
  db_user = var.db_username
  db_host = "writer.${var.domain_name}"
}

data "aws_route53_zone" "this" {
  name         = var.domain_name
  private_zone = false
}

resource "aws_route53_record" "wordpress" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = "wordpress.${var.domain_name}"
  type    = "CNAME"
  ttl     = "60" # descrease to test purpose, deafult 300
  records = [aws_elb.this.dns_name]
}

# take password through Parameter Store
# data "aws_ssm_parameter" "db" {
#   name = local.db_user
# }

resource "aws_launch_template" "this" {
  name_prefix            = var.name_prefix
  image_id               = local.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.app.id]

  user_data = base64encode(templatefile("user_data.sh.tpl", {
    db_name = local.db_name,
    db_user = local.db_user,
    #db_password = data.aws_ssm_parameter.db.value,
    db_password = var.db_password,
    db_host     = local.db_host
  }))
}

resource "aws_autoscaling_group" "this" {
  vpc_zone_identifier = var.enable_ASG_in_public_subnets ? [local.ps1, local.ps2, local.ps3] : [local.pr1, local.pr2, local.pr3]
  desired_capacity    = var.desired_capacity
  max_size            = var.max_size
  min_size            = var.min_size

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }
}

resource "aws_elb" "this" {
  name    = "${var.name_prefix}-ELB"
  subnets = [local.ps1, local.ps2, local.ps3]
  #availability_zones = [local.az1, local.az2, local.az3]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:80"
    interval            = 30
  }
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  security_groups = [aws_security_group.elb.id]
}

resource "aws_autoscaling_attachment" "asg_attachment_this" {
  autoscaling_group_name = aws_autoscaling_group.this.id
  elb                    = aws_elb.this.id
}

resource "aws_security_group" "elb" {
  name        = "TF-ELB"
  description = "Allow HTTP inbound traffic"
  vpc_id      = local.vpc_id

  ingress {
    description = "http from Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.tags
}

resource "aws_security_group" "app" {
  name        = "TF-APP"
  description = "Allow HTTP inbound traffic"
  vpc_id      = local.vpc_id

  ingress {
    description     = "http from ELB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.elb.id]
  }

  # for test purpose
  # ingress {
  #   description = "ssh from ELB"
  #   from_port   = 22
  #   to_port     = 22
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.tags
}



