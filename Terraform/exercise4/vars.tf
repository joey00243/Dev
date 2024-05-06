variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-07caf09b362be10b8"
    us-east-2 = "ami-0ddda618e961f2270"
  }
}

variable "USER" {
  default = "ec2-user"
}