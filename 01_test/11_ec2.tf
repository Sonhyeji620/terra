# data "aws_ami" "amzn" {
#   most_recent = 
  
#   filter {
#     name = "name"
#     values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#   }

#   filter {
#     name = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["amazon"]
# }

resource "aws_instance" "hjson_weba" {
  ami = "ami-04e8dfc09b22389ad" #amazonelinux2 id
  instance_type = "t2.micro"
  key_name = "hjson2-key"
  availability_zone = "ap-northeast-2a"
  private_ip = "10.0.0.11"
  subnet_id = aws_subnet.hjson_puba.id #public_subnet a의 id
  vpc_security_group_ids = [aws_security_group.hjson_sg.id]
  user_data = <<-EOF
                  #!/bin/bash
                  sudo su -
                  yum install -y httpd
                  echo "HJSON-Terraform-1" > /var/www/html/index.html
                  systemctl start httpd
                  EOF
}

resource "aws_eip" "hjson_weba_ip" {
  vpc = true
  instance = aws_instance.hjson_weba.id
  associate_with_private_ip = "10.0.0.11"
  depends_on = [
    aws_internet_gateway.hjson_ig
  ]
}

output "public_ip" {
  value = aws_instance.hjson_weba.public_ip
}