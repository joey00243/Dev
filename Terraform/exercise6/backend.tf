terraform {
  backend "s3" {
    bucket = "jomab-bucket"
    key    = "terraform-states/backend_exercise6"
    region = "us-east-1"
  }
}