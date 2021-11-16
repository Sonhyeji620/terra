resource "aws_lb_target_group_attachment" "hjson_tgatt" {
  target_group_arn = aws_lb_target_group.hjson_albtg.arn
  target_id = aws_instance.hjson_weba.id
  port = 80
}