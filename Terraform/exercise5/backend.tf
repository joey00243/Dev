terraform {
  backend "s3" {
    bucket = "jomab-bucket"
    key    = "terraform-states/backend"
    region = "us-east-1"
  }
}