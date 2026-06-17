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

resource "google_project_iam_member" "github_run_admin" {
  project = var.fe_project_id
  role = "roles/run.admin"
  member  = "serviceAccount:${google_service_account.github.email}"
}


resource "google_project_iam_member" "github_run_sa_user" {
  project = var.fe_project_id
  role = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.github.email}"
}


resource "google_project_iam_member" "github_storage_admin_fe" {
  project = var.fe_project_id
  role = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.github.email}"
}