provider "aws" {
  region = "us-east-1"

}

resource "aws_instance" "intro" {
  ami                    = "ami-07caf09b362be10b8"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  key_name               = "MyKeyPair"
  vpc_security_group_ids = ["sg-0fbcdcc6b4961c67b"]
  tags = {
    Name    = "Dove-Instance"
    Project = "Dove"
  }

}