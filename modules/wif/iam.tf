resource "google_project_iam_member" "github_compute_admin" {
  project = var.project_id
  role    = "roles/compute.admin"
  member  = "serviceAccount:${google_service_account.github.email}"
}
resource "google_project_iam_member" "github_compute_storage" {
  project = var.project_id
  role    = "roles/storage.object.admin"
  member  = "serviceAccount:${google_service_account.github.email}"
}
