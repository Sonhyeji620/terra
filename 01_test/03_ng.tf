resource "aws_eip" "hjson_eip_ng" {
  vpc = true
}

resource "aws_nat_gateway" "hjson_ng" {
  allocation_id = aws_eip.hjson_eip_ng.id
  subnet_id = aws_subnet.hjson_pub[0].id
  tags = {
    "Name" = "${var.name}-ng"
  }

  depends_on = [
    aws_internet_gateway.hjson_ig

  ]
    
}

resource "aws_route_table" "hjson-ngrt"{
  vpc_id = aws_vpc.hjson_vpc.id

  route {
    cidr_block = var.cidr_route
    gateway_id = aws_nat_gateway.hjson_ng.id

  }
  tags = {
    "Name" = "${var.name}-ngrt"
  }
}

resource "aws_route_table_association" "hjson_ngass" {
  count = "${length(var.ava)}"
  subnet_id = aws_subnet.hjson_pri[count.index].id
  route_table_id = aws_route_table.hjson-ngrt.id
}
