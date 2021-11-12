resource "aws_launch_configuration" "hjson_aslc" {
  name_prefix = "hjson-web-"
  image_id = aws_ami_from_instance.hjson_ami.id
  instance_type = "t2.micro"
  iam_instance_profile = "admin-role"
  security_groups = [aws_security_group.hjson_sg.id]
  key_name = "hjson2-key"
#  user_data = file("./install.sh")

  lifecycle {
    create_before_destroy = true
  }
  
}