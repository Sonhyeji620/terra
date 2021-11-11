resource "aws_route_table_association" "hjson_ngass_a" {
  subnet_id = aws_subnet.hjson_pria.id
  route_table_id = aws_route_table.hjson-ngrt.id
}

resource "aws_route_table_association" "hjson_ngass_c" {
  subnet_id = aws_subnet.hjson_pric.id
  route_table_id = aws_route_table.hjson-ngrt.id
}