terraform {
  backend "gcs" {
    bucket = "cs-bucket-prod-tfstate"
    prefix = "cs-network-prod-01/shared-vpc"
  }
}