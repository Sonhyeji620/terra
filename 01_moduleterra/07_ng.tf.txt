resource "aws_eip" "hjson_eip_ng" {
  vpc = true
}

resource "aws_nat_gateway" "hjson_ng" {
  allocation_id = aws_eip.hjson_eip_ng.id
  subnet_id = aws_subnet.hjson_puba.id
  tags = {
    "Name" = "hjson-ng"
  }

  depends_on = [
    aws_internet_gateway.hjson_ig

  ]
    
}