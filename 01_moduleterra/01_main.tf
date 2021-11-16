provider "aws" {
    region = var.region

}
resource "aws_key_pair" "hjson_key" {
    key_name = var.key
#    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDVeYpctq4/u+fxvTrV8a4eJN7Lm5rdVORvU1IXh8PnCugxj2YTrSQ3vksCXF42tiTHlBEabH0mong1oGcIVaiVU9Uu0MAenj87lwB9hT2sES4wEGPzzSvHPbfhIbVYDiC/Md7slqEzgQfArthZwh+ttCJ0PX6KEq7ZUaqPgip7ICR4TIbSPhaAQQqGJix6JY6IiTiOc063Ql6FTVm+/sY5ZUcQ57FcAs2+jaBiKM0+kXWL+AtdvoToIR6sabonpAvzgdN9d/mRM6OPtazKaiSzPTCk6NgKp0RA7wRJj+5A89iynIs7Inf56gAShQ+m5KF213ByJmNuCSA5Hz06Vz62EdNAkUlcrfA53aGyPpsgqY6CX/QFlAPYsutLaAfvKBij8aVuvrGZvKdOxmzuI7xpk5x5aQGIdMBaLAl9jwpbpzgIoues9LvLkO9UYdCiyjGD0kTOGPr4NgzqV4stXspotsBvkgVn2QPHWuoeAuh/MN+POe3dokcOrMG7ahKSOOc="
    public_key = file(var.key_file)
}

resource "aws_vpc" "hjson_vpc" {
    cidr_block = var.cidr_main
    tags = {
        "Name" = "${var.name}-vpc"
    }
}

# 가용영역의 public subnet
resource "aws_subnet" "hjson_pub" {
  count = length(var.cidr_public) #2
  vpc_id = aws_vpc.hjson_vpc.id
  cidr_block = var.cidr_public[count.index]
  availability_zone = "${var.region}${var.ava[count.index]}"
  tags = {
    "Name" = "${var.name}-pub${var.ava[count.index]}"
  }
}

# 가용영역의 private subnet
resource "aws_subnet" "hjson_pri" {
  count = length(var.cidr_private)
  vpc_id = aws_vpc.hjson_vpc.id
  cidr_block = var.cidr_private[count.index]
  availability_zone = "${var.region}${var.ava[count.index]}"
  tags = {
    "Name" = "${var.name}-pub${var.ava[count.index]}"
  }
  
}

# 가용영역의 private DB subnet
resource "aws_subnet" "hjson_pridb" {
  vpc_id = aws_vpc.hjson_vpc.id
  count = length(var.cidr_privatedb)
  cidr_block = var.cidr_privatedb[count.index]
  availability_zone = "${var.region}${var.ava[count.index]}"
  tags = {
    "Name" = "${var.name}-pub${var.ava[count.index]}"
  }
  
}