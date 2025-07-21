terraform {
  backend "gcs" {
    bucket = "equentis-shared-tf-remote-statefile"
    prefix = "environment/uat/service-account"
  }
}
