resource "aws_key_pair" "hjson_key" {
    key_name = "hjson2-key"

    public_key = file("../../.ssh/hjson-key.pub")
  
}
