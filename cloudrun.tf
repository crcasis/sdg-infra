module "cloudrun_fe" {
  source = "./modules/cloudrun"

  project_id = var.fe_project_id
  region     = var.region

  service_name = var.service_name
  image        = var.image

  env_vars = var.env_vars
  labels = var.labels

  load_balancer_sa = google_service_account.lb.email
}