resource "aws_lb" "hjson_alb" {
  name = "${var.name}-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.hjson_sg.id]
  #loadbalancer가 사용할 public ip
  subnets = [aws_subnet.hjson_pub[0].id, aws_subnet.hjson_pub[1].id] 

  tags = {
    "Name" = "${var.name}-alb"
  }

  
}

resource "aws_lb_target_group" "hjson_albtg" {
  name = "${var.name}-albtg"
  port = var.port_http
  protocol = var.pro_HTTP
  target_type = "instance"
  vpc_id = aws_vpc.hjson_vpc.id

  health_check {
    enabled  = true
    healthy_threshold = 3
    interval = 5
    matcher = "200"
    path = "/index.html"
    port = "traffic-port"
    protocol = var.pro_HTTP
    timeout = 2
    unhealthy_threshold = 2
  }  

}

  output "alb_dns"{
    value = aws_lb.hjson_alb.dns_name
  }

  resource "aws_lb_listener" "hjson_albli" {
  load_balancer_arn = aws_lb.hjson_alb.arn
  port = var.port_http
  protocol = var.pro_HTTP

  default_action {
  type = "forward"
  target_group_arn = aws_lb_target_group.hjson_albtg.arn
  }

}

resource "aws_lb_target_group_attachment" "hjson_tgatt" {
  target_group_arn = aws_lb_target_group.hjson_albtg.arn
  target_id = aws_instance.hjson_web.id
  port = var.port_http
}