provider "aws" {
    region = var.region

}
resource "aws_key_pair" "hjson_key" {
    key_name = var.key

    public_key = file(var.key_file)
}

resource "aws_vpc" "hjson_vpc" {
    cidr_block = var.cidr_main
    tags = {
        "Name" = "${var.name}-vpc"
    }
}

# 가용영역의 public subnet
resource "aws_subnet" "hjson_pub" {
  count = length(var.cidr_public) #2
  vpc_id = aws_vpc.hjson_vpc.id
  cidr_block = var.cidr_public[count.index]
  availability_zone = "${var.region}${var.ava[count.index]}"
  tags = {
    "Name" = "${var.name}-pub${var.ava[count.index]}"
  }
}

# 가용영역의 private subnet
resource "aws_subnet" "hjson_pri" {
  count = length(var.cidr_private)
  vpc_id = aws_vpc.hjson_vpc.id
  cidr_block = var.cidr_private[count.index]
  availability_zone = "${var.region}${var.ava[count.index]}"
  tags = {
    "Name" = "${var.name}-pub${var.ava[count.index]}"
  }
  
}

# 가용영역의 private DB subnet
resource "aws_subnet" "hjson_pridb" {
  vpc_id = aws_vpc.hjson_vpc.id
  count = length(var.cidr_privatedb)
  cidr_block = var.cidr_privatedb[count.index]
  availability_zone = "${var.region}${var.ava[count.index]}"
  tags = {
    "Name" = "${var.name}-pub${var.ava[count.index]}"
  }
  
}
