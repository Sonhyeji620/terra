resource "aws_vpc" "hjson_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        "Name" = "hjson-key"
    }
}