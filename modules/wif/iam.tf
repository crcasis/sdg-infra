resource "google_project_iam_member" "github_compute_admin" {
  project = var.project_id
  role    = "roles/compute.admin"
  member  = "serviceAccount:${google_service_account.github.email}"
}
resource "google_project_iam_member" "github_compute_storage" {
  project = var.project_id
  role    = "roles/storage.objectAdmin"
  member  = "serviceAccount:${google_service_account.github.email}"
}

resource "google_project_iam_member" "cloudrun_artifact_reader" {
  project = var.project_id
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:${google_service_account.github.email}"
}



# resource "google_project_iam_member" "github_run_admin" {
#   project = var.project_id
#   role = "roles/run.admin"
#   member  = "serviceAccount:${google_service_account.github.email}"
# }


# resource "google_project_iam_member" "github_run_sa_user" {
#   project = var.project_id
#   role = "roles/iam.workloadIdentityUser"
#   member  = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github.name}/attribute.repository/${var.github_repository}"
# }


# resource "google_project_iam_member" "github_storage_admin_fe" {
#   project = var.project_id
#   role = "roles/storage.admin"
#   member  = "serviceAccount:${google_service_account.github.email}"
# }

# resource "google_project_iam_member" "github_wif_admin" {
#   project = var.project_id

#   role = "roles/iam.workloadIdentityPoolAdmin"

#   member = "serviceAccount:${google_service_account.github.email}"
# }


# resource "google_project_iam_member" "github_sa_admin" {
#   project = var.project_id

#   role = "roles/iam.serviceAccountAdmin"

#   member = "serviceAccount:${google_service_account.github.email}"
# }