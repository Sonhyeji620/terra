resource "aws_autoscaling_attachment" "hjson_asgalbatt" {
  autoscaling_group_name = aws_autoscaling_group.hjson_asg.id
  alb_target_group_arn = aws_lb_target_group.hjson_albtg.arn
}