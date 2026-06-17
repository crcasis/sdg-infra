resource "google_cloud_run_v2_service" "fe" {
  name     = var.service_name
  location = var.region
  project  = var.project_id

  ingress = "INGRESS_TRAFFIC_ALL"

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


resource "google_cloud_run_service_iam_member" "public" {
  location = google_cloud_run_v2_service.fe.location
  service  = google_cloud_run_v2_service.fe.name

  role   = "roles/run.invoker"
  member = "allUsers"
}