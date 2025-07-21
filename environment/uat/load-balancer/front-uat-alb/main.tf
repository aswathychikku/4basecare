data "google_compute_ssl_certificate" "existing_ssl_1" {
  name    = "eq-front-uat-wildcard-ssl-crt"
  project = "equentis-uat-env"
}

data "google_compute_ssl_certificate" "existing_ssl_2" {
  name    = "eq-front-uat-ssl-crt-secrretswebsite"
  project = "equentis-uat-env"
}

data "google_compute_ssl_certificate" "existing_ssl_3" {
  name    = "eq-front-backoffice-uat-ssl-crt-pvt"
  project = "equentis-uat-env"
}

data "google_compute_ssl_certificate" "existing_ssl_4" {
  name    = "eq-uat-ssl-cert-secrrets-bucket"
  project = "equentis-uat-env"
}

data "google_compute_ssl_certificate" "existing_ssl_5" {
  name    = "eq-front-equentisedutech-uat-ssl-crt-pvt"
  project = "equentis-uat-env"
}

data "google_storage_bucket" "bucket-1" {
  name    = "alphabet-frontend"
  project = "equentis-uat-env"
}

data "google_storage_bucket" "bucket-2" {
  name    = "createwealth-frontend"
  project = "equentis-uat-env"
}

data "google_storage_bucket" "bucket-3" {
  name    = "equeconnect-frontend"
  project = "equentis-uat-env"
}

data "google_storage_bucket" "bucket-4" {
  name    = "multiplyrr-frontend"
  project = "equentis-uat-env"
}

data "google_storage_bucket" "bucket-5" {
  name    = "onboarding-ec-frontend"
  project = "equentis-uat-env"
}

data "google_storage_bucket" "bucket-7" {
  name    = "portfoliobuilder-frontend"
  project = "equentis-uat-env"
}

data "google_storage_bucket" "bucket-8" {
  name    = "secrrets-frontend"
  project = "equentis-uat-env"
}

data "google_storage_bucket" "bucket-9" {
  name    = "secrretswebsite-frontend"
  project = "equentis-uat-env"
}

data "google_storage_bucket" "bucket-10" {
  name    = "informedinvestorr-uat"
  project = "equentis-uat-env"
}

data "google_storage_bucket" "bucket-11" {
  name    = "equentis-web-uat"
  project = "equentis-uat-env"
}

data "google_storage_bucket" "bucket-12" {
  name    = "ec-iir-frontend"
  project = "equentis-uat-env"
}

data "google_compute_security_policy" "policy-1" {
  name    = "eq-front-uat-armor-policy-equeconnect"
  project = "equentis-uat-env"
}

data "google_compute_security_policy" "policy-2" {
  name    = "eq-front-uat-armor-policy-tto"
  project = "equentis-uat-env"
}



#---------------------------------------------------------------------------
#                                  backend
#---------------------------------------------------------------------------

resource "google_compute_backend_bucket" "be-bucket-alphabet" {
  name        = "be-bucket-alphabet"
  description = "Backend service for alphabet frontend application hosted on cloud storage bucket"
  project     = "equentis-uat-env"
  bucket_name = data.google_storage_bucket.bucket-1.id
  enable_cdn  = false
}

resource "google_compute_backend_bucket" "be-bucket-createwealth" {
  name        = "be-bucket-createwealth"
  description = "Backend service for createwealth frontend application hosted on cloud storage bucket"
  project     = "equentis-uat-env"
  bucket_name = data.google_storage_bucket.bucket-2.id
  enable_cdn  = false
}

resource "google_compute_backend_bucket" "be-bucket-equeconnect" {
  name                 = "be-bucket-equeconnect"
  description          = "Backend service for equeconnect frontend application hosted on cloud storage bucket"
  project              = "equentis-uat-env"
  bucket_name          = data.google_storage_bucket.bucket-3.id
  enable_cdn           = false
  edge_security_policy = data.google_compute_security_policy.policy-1.id
}

resource "google_compute_backend_bucket" "be-bucket-multiplyrr" {
  name        = "be-bucket-multiplyrr"
  description = "Backend service for multiplyrr frontend application hosted on cloud storage bucket"
  project     = "equentis-uat-env"
  bucket_name = data.google_storage_bucket.bucket-4.id
  enable_cdn  = false
}

resource "google_compute_backend_bucket" "be-bucket-onboarding-ec" {
  name        = "be-bucket-onboarding-ec"
  description = "Backend service for onboarding ec frontend application hosted on cloud storage bucket"
  project     = "equentis-uat-env"
  bucket_name = data.google_storage_bucket.bucket-5.id
  enable_cdn  = false
}


resource "google_compute_backend_bucket" "be-bucket-portfoliobuilder" {
  name        = "be-bucket-portfoliobuilder"
  description = "Backend service for portfolio builder frontend application hosted on cloud storage bucket"
  project     = "equentis-uat-env"
  bucket_name = data.google_storage_bucket.bucket-7.id
  enable_cdn  = false
}

resource "google_compute_backend_bucket" "be-bucket-secrrets" {
  name             = "be-bucket-secrrets"
  description      = "Backend service for secrrets frontend application hosted on cloud storage bucket"
  compression_mode = "DISABLED"
  project          = "equentis-uat-env"
  bucket_name      = data.google_storage_bucket.bucket-8.id
  enable_cdn       = true
}

resource "google_compute_backend_bucket" "be-bucket-secrretswebsite" {
  name        = "be-bucket-secrretswebsite"
  description = "Backend service for secrrets website frontend application hosted on cloud storage bucket"
  project     = "equentis-uat-env"
  bucket_name = data.google_storage_bucket.bucket-9.id
  enable_cdn  = false
}

resource "google_compute_backend_bucket" "informedinvestorr-uat-pub" {
  name        = "informedinvestorr-uat-pub"
  description = "Backend service for fetching data from bucket privately"
  project     = "equentis-uat-env"
  bucket_name = data.google_storage_bucket.bucket-10.id
  enable_cdn  = false
}

resource "google_compute_backend_bucket" "equentis-web-uat-backend-service-pub" {
  name             = "equentis-web-uat-backend-service-pub"
  description      = "Backend service for fetching data from bucket privately"
  project          = "equentis-uat-env"
  bucket_name      = data.google_storage_bucket.bucket-11.id
  enable_cdn       = true
  compression_mode = "DISABLED"
}

resource "google_compute_backend_bucket" "be-bucket-ec-iir" {
  name        = "be-bucket-ec-iir"
  description = "Backend service for ec-iir frontend application hosted on cloud storage bucket"
  project     = "equentis-uat-env"
  bucket_name = data.google_storage_bucket.bucket-12.id
  enable_cdn  = false
}
#---------------------------------------------------------------------------
#                                  routing rules
#---------------------------------------------------------------------------

resource "google_compute_url_map" "url_map" {
  name            = "eq-front-uat-alb"
  project         = "equentis-uat-env"
  default_service = google_compute_backend_bucket.be-bucket-alphabet.id

  # Define Host Rules

  host_rule {
    hosts        = ["createwealth-uat-gcp.equentis.com"]
    path_matcher = "path-matcher-1"
  }
  host_rule {
    hosts        = ["equeconnect-uat-gcp.equentis.com"]
    path_matcher = "path-matcher-2"
  }
  host_rule {
    hosts        = ["multiplyrr-uat-gcp.equentis.com"]
    path_matcher = "path-matcher-3"
  }
  host_rule {
    hosts        = ["onboarding-uat-gcp.equentis.com"]
    path_matcher = "path-matcher-4"
  }
  host_rule {
    hosts        = ["pb-uat-gcp.equentis.com"]
    path_matcher = "path-matcher-6"
  }

  host_rule {
    hosts        = ["api-alphabet-uat-gcp.equentis.com"]
    path_matcher = "path-matcher-10"
  }

  host_rule {
    hosts        = ["website-uat-gcp.secrrets.com"]
    path_matcher = "path-matcher-8"
  }

  host_rule {
    hosts        = ["informedinvestorr-uat-bucket.equentis.com"]
    path_matcher = "path-matcher-11"
  }

  host_rule {
    hosts        = ["equeconnect-uat-bucket.equentis.com"]
    path_matcher = "path-matcher-12"
  }

  host_rule {
    hosts        = ["equentis-web-uat-bucket.equentis.com"]
    path_matcher = "path-matcher-13"
  }
  host_rule {
    hosts        = ["backoffice-uat.secrrets.com"]
    path_matcher = "path-matcher-7"
  }

  host_rule {
    hosts        = ["ec-iir-uat-gcp.equentisedutech.com"]
    path_matcher = "path-matcher-14"
  }

  path_matcher {
    name            = "path-matcher-1"
    default_service = google_compute_backend_bucket.be-bucket-createwealth.id

  }

  path_matcher {
    name            = "path-matcher-2"
    default_service = google_compute_backend_bucket.be-bucket-equeconnect.id

  }

  path_matcher {
    name            = "path-matcher-3"
    default_service = google_compute_backend_bucket.be-bucket-multiplyrr.id

  }

  path_matcher {
    name            = "path-matcher-4"
    default_service = google_compute_backend_bucket.be-bucket-onboarding-ec.id

  }

  path_matcher {
    name            = "path-matcher-6"
    default_service = google_compute_backend_bucket.be-bucket-portfoliobuilder.id

  }

  path_matcher {
    name            = "path-matcher-7"
    default_service = google_compute_backend_bucket.be-bucket-secrrets.id

  }

  path_matcher {
    name            = "path-matcher-10"
    default_service = "https://www.googleapis.com/compute/v1/projects/equentis-uat-env/global/backendServices/alphabet-uat"
  }

  path_matcher {
    name            = "path-matcher-8"
    default_service = google_compute_backend_bucket.be-bucket-secrretswebsite.id
  }

  path_matcher {
    name            = "path-matcher-11"
    default_service = google_compute_backend_bucket.informedinvestorr-uat-pub.id
  }

  path_matcher {
    name            = "path-matcher-12"
    default_service = "https://www.googleapis.com/compute/v1/projects/equentis-uat-env/global/backendServices/equeconnect-uat"
  }

  path_matcher {
    name            = "path-matcher-13"
    default_service = google_compute_backend_bucket.equentis-web-uat-backend-service-pub.id
  }

  path_matcher {
    name            = "path-matcher-14"
    default_service = google_compute_backend_bucket.be-bucket-ec-iir.id
  }
}



resource "google_compute_target_https_proxy" "https_proxy" {
  name    = "eq-front-uat-alb-target-proxy"
  project = "equentis-uat-env"
  url_map = google_compute_url_map.url_map.id
  ssl_certificates = [
    data.google_compute_ssl_certificate.existing_ssl_1.id,
    data.google_compute_ssl_certificate.existing_ssl_2.id,
    data.google_compute_ssl_certificate.existing_ssl_4.id,
    data.google_compute_ssl_certificate.existing_ssl_3.id,
    data.google_compute_ssl_certificate.existing_ssl_5.id
  ]
}

resource "google_compute_global_forwarding_rule" "https_forwarding_rule" {
  name                  = "eq-front-uat-alb-front"
  project               = "equentis-uat-env"
  target                = google_compute_target_https_proxy.https_proxy.id
  port_range            = "443"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  ip_address            = "34.8.75.114"
}
