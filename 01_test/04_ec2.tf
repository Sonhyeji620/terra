resource "aws_security_group" "hjson_sg" {
  name = "Allow Basic"
  description = "Allow HTTP,SSH,ICMP,SQL"
  vpc_id = aws_vpc.hjson_vpc.id

  ingress = [
    {
      description = "Allow HTTP"
      from_port = var.port_http
      to_port = var.port_http
      protocol = var.pro_tcp
      cidr_blocks = [var.cidr_route]
      ipv6_cidr_blocks = [var.cidr_v6]
      prefix_list_ids = null
      security_groups = null
      self = null

    },
    {
      description = "Allow SSH"
      from_port = 22
      to_port = 22
      protocol = var.pro_tcp
      cidr_blocks = [var.cidr_route]
      ipv6_cidr_blocks = [var.cidr_v6]
      prefix_list_ids = null
      security_groups = null
      self = null

    },
    {
      description = "Allow SQL"
      from_port = 3306
      to_port = 3306
      protocol = var.pro_tcp
      cidr_blocks = [var.cidr_route]
      ipv6_cidr_blocks = [var.cidr_v6]
      prefix_list_ids = null
      security_groups = null
      self = null

    },
    {
      description = "Allow ICMP"
      from_port = 0
      to_port = 0
      protocol = "icmp"
      cidr_blocks = [var.cidr_route]
      ipv6_cidr_blocks = [var.cidr_v6]
      prefix_list_ids = null
      security_groups = null
      self = null

    }
  ]
  
  egress = [
    {
      description = "ALL"
      from_port = 0
      to_port = 0
      protocol = -1
      cidr_blocks = [var.cidr_route]
      ipv6_cidr_blocks = [var.cidr_v6]
      prefix_list_ids = null
      security_groups = null
      self = null
    }
  ]
  tags = {
      "Name" = "${var.name}_sg"
    }
}

resource "aws_instance" "hjson_web" {
  ami = "ami-04e8dfc09b22389ad" #amazonelinux2 id
  instance_type = var.instance
  key_name = var.key
  availability_zone = "${var.region}${var.ava[0]}"
  private_ip = var.private_ip
  subnet_id = aws_subnet.hjson_pub[0].id 
  vpc_security_group_ids = [aws_security_group.hjson_sg.id]
  user_data = file("./install.sh")

    tags = {
    Name = "${var.name}-web"
  }
}

resource "aws_eip" "hjson_web_ip" {
  vpc = true
  instance = aws_instance.hjson_web.id
  associate_with_private_ip = var.private_ip
  depends_on = [
    aws_internet_gateway.hjson_ig
  ]
}

output "public_ip" {
  value = aws_instance.hjson_web.public_ip
}