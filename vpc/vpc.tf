resource "aws_vpc" "main" {
  cidr_block = "var.cidr_block"
}

resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "var.public_subnet1_cidr"

  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "var.public_subnet2_cidr"

  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "public3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "var.public_subnet3_cidr"

  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "var.private_subnet1_cidr"

  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "var.private_subnet2_cidr"

  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "private3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "var.private_subnet3_cidr"

  tags = {
    Name = "Main"
  }
}
