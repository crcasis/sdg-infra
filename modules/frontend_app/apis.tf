resource "google_project_service" "services" {
  for_each = toset([
    "run.googleapis.com",
    "compute.googleapis.com",
    "iap.googleapis.com",
    "secretmanager.googleapis.com",
    "storage.googleapis.com",
    "certificatemanager.googleapis.com"
  ])

  project = var.project_id
  service = each.key

  disable_on_destroy = false
}