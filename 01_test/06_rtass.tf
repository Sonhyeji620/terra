resource "aws_route_table_association" "hjson_rtasa" {
  subnet_id = aws_subnet.hjson_puba.id
  route_table_id = aws_route_table.hjson_rt.id 
}
resource "aws_route_table_association" "hjson_rtasc" {
  subnet_id = aws_subnet.hjson_pubc.id
  route_table_id = aws_route_table.hjson_rt.id 
}