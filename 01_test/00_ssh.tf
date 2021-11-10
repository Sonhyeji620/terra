resource "aws_key_pair" "hjson_key" {
    key_name = "hjson2-key"
#    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDVeYpctq4/u+fxvTrV8a4eJN7Lm5rdVORvU1IXh8PnCugxj2YTrSQ3vksCXF42tiTHlBEabH0mong1oGcIVaiVU9Uu0MAenj87lwB9hT2sES4wEGPzzSvHPbfhIbVYDiC/Md7slqEzgQfArthZwh+ttCJ0PX6KEq7ZUaqPgip7ICR4TIbSPhaAQQqGJix6JY6IiTiOc063Ql6FTVm+/sY5ZUcQ57FcAs2+jaBiKM0+kXWL+AtdvoToIR6sabonpAvzgdN9d/mRM6OPtazKaiSzPTCk6NgKp0RA7wRJj+5A89iynIs7Inf56gAShQ+m5KF213ByJmNuCSA5Hz06Vz62EdNAkUlcrfA53aGyPpsgqY6CX/QFlAPYsutLaAfvKBij8aVuvrGZvKdOxmzuI7xpk5x5aQGIdMBaLAl9jwpbpzgIoues9LvLkO9UYdCiyjGD0kTOGPr4NgzqV4stXspotsBvkgVn2QPHWuoeAuh/MN+POe3dokcOrMG7ahKSOOc="
    public_key = file("../../.ssh/hjson-key.pub")
  
}