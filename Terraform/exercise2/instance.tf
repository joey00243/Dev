resource "aws_instance" "dove-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "MyKeyPair"
  vpc_security_group_ids = ["sg-0fbcdcc6b4961c67b"]
  tags = {
    Name    = "Dove-Instance"
    Project = "Dove"
  }
}