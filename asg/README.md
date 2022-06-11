# ASG for AWS
### This project will create Auto Scaling Group (ASG) a Three-Tier application on AWS.

## Table of Contents
```
```
1. [General info]

2. [Providers](https://github.com/rus777777/terraform-team-1/blob/main/asg/provider.tf)

3. [Usage](https://github.com/rus777777/terraform-team-1/blob/main/asg/main.tf)

3. [Variables](https://github.com/rus777777/terraform-team-1/blob/main/asg/variable.tf) / [Environment Variables](https://github.com/rus777777/terraform-team-1/blob/main/asg/example.tfvars)
4. [Packer](https://github.com/rus777777/terraform-team-1/blob/main/packer/README.md)


## General info
This repo create ASG that scales upyo 3 replicas, based on the LB traffic. There will be at least 1 instance that host wordpress website that has static IP.

## Providers
Name            | Version
----------------|---------
Terraform       | v1.1.1


## Usage

```
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



```
