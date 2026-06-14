resource "google_service_account" "frontend" {
  project      = var.project_id
  account_id   = "frontend-cloudrun"
  display_name = "Frontend Cloud Run"
}