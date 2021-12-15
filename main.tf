terraform {
  backend "s3" {
    bucket = "plana-challenge"
    key    = "challenger"
    region = "us-east-1"
  }
}
