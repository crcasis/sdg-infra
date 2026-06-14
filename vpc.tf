module "vpc" {
  source        = "./modules/vpc"
  region        = var.region
  vpcs          = var.vpcs
  subnets       = var.subnets
  proxy_subnets = var.proxy_subnets
}