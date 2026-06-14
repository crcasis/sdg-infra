resource "google_secret_manager_secret" "frontend_config" {
  project   = var.project_id
  secret_id = "frontend-config"

  replication {
    auto {}
  }
}