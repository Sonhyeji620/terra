resource "aws_route_table" "hjson-ngrt"{
  vpc_id = aws_vpc.hjson_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.hjson_ng.id

  }
  tags = {
    "Name" = "hjson-ngrt"
  }
}