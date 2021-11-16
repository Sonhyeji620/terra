variable "name" {
  type = string
  # default = "hjson"
}


variable "region" {
  type = string
  # default = "ap-northeast-2"
}

variable "ava" {
  type = list(string)
  # default = ["a","c"]
}

variable "key" {
  type = string
  # default = "hjson-key"
}

variable "cidr_main" {
  type = string
  # default = "10.0.0.0/16"
}

variable "cidr_public" {
  type = list(string)
  # default = ["10.0.0.0/24","10.0.2.0/24"]
}

variable "cidr_private" {
  type = list(string)
  # default = ["10.0.1.0/24","10.0.3.0/24"]
}

variable "cidr_privatedb" {
  type = list(string)
  # default = ["10.0.5.0/24","10.0.6.0/24"]
}

variable "cidr_route" {
  type = string
  # default = "0.0.0.0/0"

}

variable "cidr_v6" {
  type = string
  # default = "::/0"
}

variable "pro_HTTP" {
  type = string
  # default = "HTTP"
}

variable "pro_tcp" {
  type = string
  # default = "tcp"
}

variable "port_http" {
  type = number
  # default = 80
}

variable "instance" {
  type = string
  # default = "t2.micro"
}

variable "private_ip" {
  type = string
  # default = "10.0.0.11"
}

variable "key_file" {
  type = string
  # default = "../../.ssh/hjson-key.pub"
}

variable "instance_db" {
  type = string
  # default = "db.t2.micro"
}

variable "name_db" {
  type = string
  # default = "test"
}

variable "username" {
  type = string
  # default = "admin"
}

variable "password" {
  type = string
  # default = "It12345!"
}

variable "sql_engine" {
  type = string
  # default = "mysql"
}
