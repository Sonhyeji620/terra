resource "aws_db_instance" "hjson_rds" {
  allocated_storage = 20
  storage_type = "gp2"
  engine = var.sql_engine
  engine_version = "8.0"
  instance_class = var.instance_db
  name = var.name_db
  identifier = var.name_db
  username = var.username
  password = var.password
  parameter_group_name = "default.mysql8.0"
  availability_zone = "${var.region}${var.ava[0]}"
  db_subnet_group_name = aws_db_subnet_group.hjson_dbsb.id
  vpc_security_group_ids = [aws_security_group.hjson_sg.id]
  skip_final_snapshot = true
  tags = {
    "Name" = "${var.name}-rds"
  }
}

resource "aws_db_subnet_group" "hjson_dbsb" {
  name = "hjson-dbsb-group"
  subnet_ids = [aws_subnet.hjson_pridb[0].id, aws_subnet.hjson_pridb[1].id]
  tags = {
    "Name" = "${var.name}-dbsb-gp"
  }
  
}