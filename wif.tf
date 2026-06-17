module "github_wif" {
  source = "./modules/github_wif"

  project_id         = var.hub_project_id
  pool_id            = "github-pool"
  provider_id        = "github-provider"
  github_repository  = "crcasis/sdg-infra"
  service_account_id = "github-actions"
}