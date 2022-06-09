packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "image" {
  ami_name             = "golden-image-project-1-{{timestamp}}"
  ssh_private_key_file = "/home/ec2-user/.ssh/id_rsa"
  ssh_keypair_name     = "packer" # from VM where you launch this code
  instance_type        = "t2.micro"
  ssh_username         = "ec2-user"
  region               = var.region

  # find latest Amazon Linux 2 
  source_ami_filter {
    filters = {
      virtualization-type = "hvm"
      name                = "amzn2-ami-kernel-5.10-hvm-2.0.*"
      root-device-type    = "ebs"
    }
    owners      = ["137112412989"]
    most_recent = true
  }

  run_tags = {
    Name    = "Packer Image"
    Project = "Terraform Project 1"
  }
}

build {
  sources = [
    "source.amazon-ebs.image"
  ]
  provisioner "shell" {
    inline = [
      # telnet for troubleshooting
      "sudo yum install telnet -y",
      "sudo yum install httpd -y",
      "sudo yum install php php-mysql -y",
      "sudo yum install wget -y",
      "sudo wget https://wordpress.org/wordpress-4.0.32.tar.gz",
      "sudo tar -xf wordpress-4.0.32.tar.gz -C /var/www/html/",
      "sudo mv /var/www/html/wordpress/* /var/www/html/",
      "sudo chown -R apache:apache /var/www/html/",
      # "sudo systemctl enable httpd",
      # "sudo systemctl restart httpd"
    ]
  }

  // provisioner "breakpoint" {
  //   note = "Waiting for your verification"
  // }
}
