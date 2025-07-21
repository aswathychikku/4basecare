data "google_compute_region_ssl_certificate" "existing_ssl" {
  name    = "eq-front-uat-wildcard-ssl-crt-pvt"
  region  = "asia-south1"
  project = "equentis-uat-env"
}

data "google_compute_network_endpoint_group" "neg_zone_a" {
  name    = "cms-eqw-svc-3004-neg" # Replace with your NEG name
  zone    = "asia-south1-a"
  project = "equentis-uat-env"
}

data "google_compute_network_endpoint_group" "neg_zone_b" {
  name    = "cms-eqw-svc-3004-neg" # Replace with your NEG name
  zone    = "asia-south1-b"
  project = "equentis-uat-env"
}

data "google_compute_network_endpoint_group" "neg_zone1_b" {
  name    = "eqw-eqw-svc-3000-neg" # Replace with your NEG name
  zone    = "asia-south1-b"
  project = "equentis-uat-env"
}

data "google_compute_network_endpoint_group" "neg_zone1_a" {
  name    = "eqw-eqw-svc-3000-neg" # Replace with your NEG name
  zone    = "asia-south1-a"
  project = "equentis-uat-env"
}

resource "google_compute_region_health_check" "eq_blog_hc" {
  name    = "eq-blog-hc"
  project = "equentis-uat-env"
  region  = "asia-south1"
  http_health_check {
    port         = 443
    request_path = "/index.html"
  }
  check_interval_sec  = 5
  timeout_sec         = 5
  unhealthy_threshold = 2
  healthy_threshold   = 2
}

resource "google_compute_region_health_check" "eq_cms_hc" {
  name    = "eq-cms-hc"
  project = "equentis-uat-env"
  region  = "asia-south1"
  http_health_check {

    port_specification = "USE_SERVING_PORT"
    port               = 0
    request_path       = "/"
  }
  check_interval_sec  = 5
  timeout_sec         = 5
  unhealthy_threshold = 2
  healthy_threshold   = 2
}

resource "google_compute_region_health_check" "eq_equentisweb_hc" {
  name    = "eq-equentisweb-hc"
  project = "equentis-uat-env"
  region  = "asia-south1"
  http_health_check {
    port_specification = "USE_SERVING_PORT"
    port               = 0
    request_path       = "/"
  }
  check_interval_sec  = 5
  timeout_sec         = 5
  unhealthy_threshold = 2
  healthy_threshold   = 2
}

resource "google_compute_region_health_check" "eq_back_alphabet_hc" {
  name    = "eq-back-alphabet-hc"
  project = "equentis-uat-env"
  region  = "asia-south1"
  tcp_health_check {
    port = 80
  }
  check_interval_sec  = 5
  timeout_sec         = 5
  unhealthy_threshold = 2
  healthy_threshold   = 2
}

#---------------------------------------------------------------------------
#                                  backend
#---------------------------------------------------------------------------

resource "google_compute_region_backend_service" "be_eqw_blog_pvt" {
  name                  = "be-eqw-blog-pvt"
  project               = "equentis-uat-env"
  protocol              = "HTTP"
  region                = "asia-south1"
  load_balancing_scheme = "INTERNAL_MANAGED"
  locality_lb_policy    = "ROUND_ROBIN"
  description           = "Backend service for blog application hosted on virtual machine"
  backend {
    balancing_mode               = "UTILIZATION"
    capacity_scaler              = 1
    failover                     = false
    group                        = "projects/equentis-uat-env/zones/asia-south1-a/instanceGroups/eq-uat-mig-blog"
    max_connections              = 0
    max_connections_per_endpoint = 0
    max_connections_per_instance = 0
    max_rate                     = 0
    max_rate_per_endpoint        = 0
    max_rate_per_instance        = 0
    max_utilization              = 0.8
  }

  health_checks = [google_compute_region_health_check.eq_blog_hc.self_link]

  timeout_sec = 30

  ip_address_selection_policy = "IPV4_ONLY"

  enable_cdn = false
}

resource "google_compute_region_backend_service" "be_eqw_cms_pvt" {
  name                  = "be-eqw-cms-pvt"
  protocol              = "HTTP"
  project               = "equentis-uat-env"
  region                = "asia-south1"
  load_balancing_scheme = "INTERNAL_MANAGED"
  locality_lb_policy    = "ROUND_ROBIN"
  description           = "Backend service for cms application hosted on gke"
  backend {
    balancing_mode        = "RATE"
    capacity_scaler       = 1
    max_rate_per_endpoint = 100000000
    group                 = data.google_compute_network_endpoint_group.neg_zone_a.id
  }

  backend {
    balancing_mode        = "RATE"
    max_rate_per_endpoint = 100000000
    capacity_scaler       = 1
    group                 = data.google_compute_network_endpoint_group.neg_zone_b.id
  }


  health_checks = [google_compute_region_health_check.eq_cms_hc.self_link]

  timeout_sec = 30

  ip_address_selection_policy = "IPV4_ONLY"

  enable_cdn = false
}

resource "google_compute_region_backend_service" "be_eqw_eqw_pvt" {
  name                  = "be-eqw-eqw-pvt"
  protocol              = "HTTP"
  region                = "asia-south1"
  load_balancing_scheme = "INTERNAL_MANAGED"
  locality_lb_policy    = "ROUND_ROBIN"
  project               = "equentis-uat-env"
  description           = "Backend service for equentis website application hosted on gke"
  backend {
    balancing_mode        = "RATE"
    capacity_scaler       = 1
    max_rate_per_endpoint = 100000000
    group                 = data.google_compute_network_endpoint_group.neg_zone1_a.id
  }

  backend {
    balancing_mode        = "RATE"
    max_rate_per_endpoint = 100000000
    capacity_scaler       = 1
    group                 = data.google_compute_network_endpoint_group.neg_zone1_b.id
  }


  health_checks = [google_compute_region_health_check.eq_equentisweb_hc.self_link]

  timeout_sec = 30

  ip_address_selection_policy = "IPV4_ONLY"

  enable_cdn = false
}


#---------------------------------------------------------------------------
#                                  routing rules
#---------------------------------------------------------------------------

resource "google_compute_region_url_map" "url_map" {
  name            = "eq-uat-alb-pvt"
  region          = "asia-south1"
  project         = "equentis-uat-env"
  default_service = "projects/equentis-uat-env/regions/asia-south1/backendServices/be-eqw-cms-pvt"

  host_rule {
    hosts        = ["cms-uat-gcp.equentis.com"]
    path_matcher = "path-matcher-1"
  }

  path_matcher {
    name            = "path-matcher-1"
    default_service = "projects/equentis-uat-env/regions/asia-south1/backendServices/be-eqw-cms-pvt"
  }

  host_rule {
    hosts        = ["website-uat-gcp.equentis.com"]
    path_matcher = "path-matcher-2"
  }

  path_matcher {
    name            = "path-matcher-2"
    default_service = "projects/equentis-uat-env/regions/asia-south1/backendServices/be-eqw-eqw-pvt"
    route_rules {
      match_rules {
        prefix_match = "/blog/"
      }

      priority = 1

      route_action {
        weighted_backend_services {
          backend_service = "projects/equentis-uat-env/regions/asia-south1/backendServices/be-eqw-blog-pvt"
          weight          = 100
        }
      }
    }

    route_rules {
      match_rules {
        prefix_match = "/blog"
      }

      priority = 2

      url_redirect {
        prefix_redirect        = "/blog/"
        redirect_response_code = "MOVED_PERMANENTLY_DEFAULT"
        strip_query            = false

      }
    }

  }



  host_rule {
    hosts        = ["api-alphabet-uat-gcp.equentis.com"]
    path_matcher = "path-matcher-3"
  }

  path_matcher {
    name            = "path-matcher-3"
    default_service = "projects/equentis-uat-env/regions/asia-south1/backendServices/eq-back-uat-alb-alphabet-back-pvt"
  }
}



#---------------------------------------------------------------------------
#                                  front-end
#---------------------------------------------------------------------------

resource "google_compute_region_target_https_proxy" "eq_uat_alb_pvt_front" {
  name             = "eq-uat-alb-pvt-target-proxy-2"
  region           = "asia-south1"
  project          = "equentis-uat-env"
  url_map          = google_compute_region_url_map.url_map.id
  ssl_certificates = [data.google_compute_region_ssl_certificate.existing_ssl.self_link]
}

resource "google_compute_forwarding_rule" "eq_uat_alb_pvt_front_forwarding" {
  name                  = "eq-uat-alb-pvt-front"
  region                = "asia-south1"
  ip_address            = "10.55.0.61"
  project               = "equentis-uat-env"
  target                = google_compute_region_target_https_proxy.eq_uat_alb_pvt_front.self_link
  port_range            = "443"
  load_balancing_scheme = "INTERNAL_MANAGED"
  network               = "vpc-uat-services-base"
  subnetwork            = "sb-uat-services-base-asso1-k8s-node"
}
