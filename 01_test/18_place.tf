resource "aws_placement_group" "hjson_place" {
  name = "hjson-place"
  strategy = "cluster"
  
}