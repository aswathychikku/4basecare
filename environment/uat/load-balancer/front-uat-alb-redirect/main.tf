resource "google_compute_url_map" "eq_front_uat_alb_front_redirect" {
  name        = "eq-front-uat-alb-front-redirect"
  description = "Automatically generated HTTP to HTTPS redirect for the eq-front-uat-alb-front forwarding rule"
  project     = "equentis-uat-env"
  default_url_redirect {
    https_redirect         = true
    redirect_response_code = "MOVED_PERMANENTLY_DEFAULT"
    strip_query            = false
  }
}

resource "google_compute_target_http_proxy" "eq_front_uat_alb_front_target_proxy" {
  name    = "eq-front-uat-alb-front-target-proxy"
  url_map = google_compute_url_map.eq_front_uat_alb_front_redirect.self_link
  project = "equentis-uat-env"
}

resource "google_compute_global_forwarding_rule" "https_forwarding_rule" {
  name                  = "eq-front-uat-alb-front-forwarding-rule"
  project               = "equentis-uat-env"
  target                = google_compute_target_http_proxy.eq_front_uat_alb_front_target_proxy.self_link
  port_range            = "80"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  ip_address            = "34.8.75.114"
}
