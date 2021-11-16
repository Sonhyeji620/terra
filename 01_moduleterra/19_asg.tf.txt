resource "aws_autoscaling_group" "hjson_asg" {
  name = "hjson-asg"
  min_size = 2
  max_size = 10
  health_check_grace_period = 10
  health_check_type = "EC2"
  desired_capacity = 2
  force_delete = true
  launch_configuration = aws_launch_configuration.hjson_aslc.name
  vpc_zone_identifier = [aws_subnet.hjson_puba.id, aws_subnet.hjson_pubc.id]
}