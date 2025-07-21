terraform {
  backend "gcs" {
    bucket = "cs-bucket-prod-tfstate"
    prefix = "cs-network-prod-transit-01/vpc-peering"
  }
}
