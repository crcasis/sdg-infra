resource "google_cloud_run_v2_service" "fe" {
  name     = var.service_name
  location = var.region
  project  = var.project_id

  # Solo permite tráfico interno mediante Internal Load Balancer
  ingress = "INGRESS_TRAFFIC_INTERNAL_LOAD_BALANCER"

  deletion_protection = false
  labels = var.labels

  template {
    containers {
      image = var.image

      dynamic "env" {
        for_each = var.env_vars

        content {
          name  = env.key
          value = env.value
        }
      }
    }
  }
}


# Serverless NEG para conectar Cloud Run al Internal HTTPS Load Balancer
resource "google_compute_region_network_endpoint_group" "fe" {
  name                  = "${var.service_name}-neg"
  project               = var.project_id
  region                = var.region

  network_endpoint_type = "SERVERLESS"

  cloud_run {
    service = google_cloud_run_v2_service.fe.name
  }
}


resource "google_cloud_run_service_iam_member" "lb_invoker" {
  location = google_cloud_run_v2_service.fe.location
  service  = google_cloud_run_v2_service.fe.name

  role = "roles/run.invoker"

  member = "serviceAccount:${google_service_account.lb.email}"
}

resource "google_service_account" "lb" {
  project      = var.hub_project_id
  account_id   = "lb-sa"
  display_name = "Internal Load Balancer SA"
}

