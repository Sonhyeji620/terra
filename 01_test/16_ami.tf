resource "aws_ami_from_instance" "hjson_ami" {
  name = "hjson-aws-ami"
  source_instance_id = aws_instance.hjson_weba.id

  depends_on = [
    aws_instance.hjson_weba
  ]
  
}