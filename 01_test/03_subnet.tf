# 가용영역 a의 public subnet
resource "aws_subnet" "hjson_puba" {
  vpc_id = aws_vpc.hjson_vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "hjson-puba"
  }
  
}

# 가용영역 a의 private subnet
resource "aws_subnet" "hjson_pria" {
  vpc_id = aws_vpc.hjson_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "hjson-pria"
  }
  
}

# 가용영역 c의 public subnet
resource "aws_subnet" "hjson_pubc" {
  vpc_id = aws_vpc.hjson_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "hjson-pubc"
  }
  
}

# 가용영역 c의 private subnet
resource "aws_subnet" "hjson_pric" {
  vpc_id = aws_vpc.hjson_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "hjson-pric"
  }
  
}