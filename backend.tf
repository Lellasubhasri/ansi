terraform {
  backend "s3" {
    bucket         = "migration3-subha-la"
    key            = "talent-academy/backend/terraform.tfstates"
    region         = "eu-central-1"
    dynamodb_table = "terraform-lock"
  }
}