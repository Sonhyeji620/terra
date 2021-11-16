resource "aws_internet_gateway" "hjson_ig" {
  vpc_id = aws_vpc.hjson_vpc.id

  tags = {
    "Name" = "${var.name}-ig"
  }
  
}

resource "aws_route_table" "hjson_rt" {
  vpc_id = aws_vpc.hjson_vpc.id

  route {
    cidr_block = var.cidr_route
    gateway_id = aws_internet_gateway.hjson_ig.id

  }
  tags = {
    "Name" = "${var.name}-rt"
  }
  
}

resource "aws_route_table_association" "hjson_rtasa" {
  count = length(var.cidr_public)
  subnet_id = aws_subnet.hjson_pub[count.index].id
  route_table_id = aws_route_table.hjson_rt.id 
}
