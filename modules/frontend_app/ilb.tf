resource "google_compute_region_backend_service" "fe" {
  name                  = "${var.service_name}-backend"
  project               = var.project_id
  region                = var.region

  protocol              = "HTTP"
  load_balancing_scheme = "INTERNAL_MANAGED"

  backend {
    group = google_compute_region_network_endpoint_group.fe.id
  }
}

resource "google_compute_region_url_map" "fe" {
  name            = "${var.service_name}-url-map"
  project         = var.project_id
  region          = var.region

  default_service = google_compute_region_backend_service.fe.id
}

resource "google_compute_region_target_http_proxy" "fe" {
  name    = "frontend-http-proxy"
  project = var.project_id
  region  = var.region

  url_map = google_compute_region_url_map.fe.id
}

resource "google_compute_address" "fe_ilb" {
  name         = "fe-ilb-ip"
  project      = var.project_id
  region       = var.region
  address_type = "INTERNAL"

  subnetwork = var.apps_subnet_self_link
}

resource "google_compute_forwarding_rule" "fe" {
  name    = "fe-ilb"
  project = var.project_id
  region  = var.region

  load_balancing_scheme = "INTERNAL_MANAGED"

  ip_protocol = "TCP"
  port_range  = "80"

  network    = var.network_self_link
  subnetwork = var.apps_subnet_self_link

  target = google_compute_region_target_http_proxy.fe.id

  ip_address = google_compute_address.fe_ilb.address
}