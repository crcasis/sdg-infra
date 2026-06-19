# module "cloudrun_fe" {
#   source = "./modules/cloudrun"

#   project_id = var.hub_project_id
#   region     = var.region

#   service_name = var.service_name
#   image        = var.image

#   env_vars = var.env_vars
#   labels = var.labels
# }