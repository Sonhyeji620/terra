resource "aws_route_table" "hjson_rt" {
  vpc_id = aws_vpc.hjson_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.hjson_ig.id

  }
  tags = {
    "Name" = "hjson-rt"
  }
  
}