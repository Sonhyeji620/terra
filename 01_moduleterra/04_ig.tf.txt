# 10.0.0.0/24 VPC 전용 Internet Gateway
resource "aws_internet_gateway" "hjson_ig" {
  vpc_id = aws_vpc.hjson_vpc.id

  tags = {
    "Name" = "hjson-ig"
  }
  
}