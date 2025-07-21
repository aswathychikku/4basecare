terraform {
  backend "gcs" {
    bucket = "equentis-shared-tf-remote-statefile"
    prefix = "environ/uat/vm"
  }
}
