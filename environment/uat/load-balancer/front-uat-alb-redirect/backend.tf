terraform {
  backend "gcs" {
    bucket = "equentis-shared-tf-remote-statefile"
    prefix = "environment/uat/load-balancer/front-uat-alb-redirect"
  }
}
