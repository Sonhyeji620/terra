resource "aws_lb" "hjson_alb" {
  name = "hjson-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.hjson_sg.id]
  subnets = [aws_subnet.hjson_puba.id, aws_subnet.hjson_pubc.id]

  tags = {
    "Name" = "hjson-alb"
  }

  
}