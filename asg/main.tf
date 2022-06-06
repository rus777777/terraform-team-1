data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    # change backet name to  terraform-tfstate-<YOUR-NAME> 
    bucket = "terraform-tfstate-rus" # !!!
    # bucket = "terraform-tfstate-${local.account_id}" # !!!

    key    = "project-team-1/dev/vpc"
    region = "us-east-1"
  }
}

data "aws_caller_identity" "current" {}

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

  account_id = data.aws_caller_identity.current.account_id
  user_id    = data.aws_caller_identity.current.user_id
  ami_id     = data.aws_ami.this.image_id
}

output "account_id" {
  value = local.account_id
}

output "user_id" {
  value = local.user_id
}

output "ami_id" {
  value = local.ami_id
}

resource "aws_launch_template" "this" {
  name_prefix   = var.name_prefix
  image_id      = local.ami_id
  instance_type = var.instance_type
}

resource "aws_autoscaling_group" "this" {
  
  vpc_zone_identifier = [local.ps1, local.ps2, local.ps3]
  desired_capacity    = var.desired_capacity
  max_size            = var.max_size
  min_size            = var.min_size

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }
}

resource "aws_elb" "this" {
  name    = "${var.name_prefix}-elbs"
  subnets = [local.ps1, local.ps2, local.ps3]

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
}

resource "aws_autoscaling_attachment" "asg_attachment_this" {
  autoscaling_group_name = aws_autoscaling_group.this.id
  elb                    = aws_elb.this.id
}
