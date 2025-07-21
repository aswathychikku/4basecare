data "google_compute_network_endpoint_group" "neg_zone_a" {
  name    = "cms-eqw-svc-3004-neg"  
  zone    = "asia-south1-a"
  project = "equentis-uat-env"
}

data "google_compute_network_endpoint_group" "neg_zone_b" {
  name    = "cms-eqw-svc-3004-neg"  
  zone    = "asia-south1-b"
  project = "equentis-uat-env"
}

resource "google_compute_region_health_check" "eq_cms_hc" {
  name               = "eq-cms-hc"
  project = "equentis-uat-env"
  region  = "asia-south1"
  http_health_check {

    port_specification = "USE_SERVING_PORT"
    port = 0
    request_path = "/"
  }
  check_interval_sec = 5
  timeout_sec        = 5
  unhealthy_threshold = 2
  healthy_threshold   = 2
}

resource "google_compute_region_backend_service" "be_eqw_cms_pvt" {
  name                    = "be-eqw-cms-pvt"
  description = "Backend service for cms application hosted on gke"
  protocol                = "HTTP"
  project = "equentis-uat-env"
  region                  = "asia-south1"
  load_balancing_scheme   = "INTERNAL_MANAGED"
  locality_lb_policy      = "ROUND_ROBIN"
  backend {
    balancing_mode         = "RATE"
    capacity_scaler        = 1
    max_rate_per_endpoint  = 100000000
    group                  = data.google_compute_network_endpoint_group.neg_zone_a.id
  }

  backend {
     balancing_mode         = "RATE"
     max_rate_per_endpoint  = 100000000
     capacity_scaler        = 1
     group                  = data.google_compute_network_endpoint_group.neg_zone_b.id     
  }


  health_checks = [google_compute_region_health_check.eq_cms_hc.self_link]

  timeout_sec  = 30

  ip_address_selection_policy = "IPV4_ONLY"

  enable_cdn = false
}


resource "google_compute_region_url_map" "eq_front_uat_alb_front_redirect" {
  name = "eq-uat-alb-pvt-redirect"
  default_service    = "https://www.googleapis.com/compute/v1/projects/equentis-uat-env/regions/asia-south1/backendServices/be-eqw-cms-pvt"
  
  project = "equentis-uat-env"

  host_rule {
    hosts       = ["*"]
    path_matcher = "matcher1"
  }

  path_matcher {
    name            = "matcher1"
    default_url_redirect {
      host_redirect     = "10.55.0.61:443"
      https_redirect    = true
      redirect_response_code = "PERMANENT_REDIRECT"
      strip_query       = false
    }
  }

}

resource "google_compute_region_target_http_proxy" "proxy" {
  name             = "eq-uat-alb-pvt-redirect-target-proxy"
  region           = "asia-south1"
  url_map          = google_compute_region_url_map.eq_front_uat_alb_front_redirect.id  
  project = "equentis-uat-env"
}

resource "google_compute_forwarding_rule" "eq_uat_alb_pvt_redirect_forwarding_rule" {
  name         = "eq-uat-alb-pvt-redirect-forwarding-rule"
  project = "equentis-uat-env"
  region       = "asia-south1"
  ip_address   = "10.55.0.61"
  ip_protocol  = "TCP"
  port_range   = "80"
  load_balancing_scheme = "INTERNAL_MANAGED" 
  network      = "https://www.googleapis.com/compute/v1/projects/equentis-shared-services/global/networks/vpc-uat-services-base"
  network_tier = "PREMIUM"
  subnetwork   = "https://www.googleapis.com/compute/v1/projects/equentis-shared-services/regions/asia-south1/subnetworks/sb-uat-services-base-asso1-k8s-node"
  target       = google_compute_region_target_http_proxy.proxy.self_link
  description  = ""
}
