################## #  GCS Bucket   # ##################

module "buckets" {
  source  = "../../../modules/storage/gcs-bucket"
  buckets = var.buckets
}


