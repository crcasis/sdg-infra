## VPC ##
resource "google_compute_network" "vpc" {
  for_each = {
    for vpc in var.vpcs :
    vpc.name => vpc
  }

  name                    = each.value.name
  project                 = each.value.project_id
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

## SUBNETS NORMALES ##
resource "google_compute_subnetwork" "subnet" {
  for_each = {
    for subnet in var.subnets :
    subnet.name => subnet
  }

  name                     = each.value.name
  region                   = each.value.region
  project                  = each.value.project_id
  network                  = google_compute_network.vpc[each.value.vpc_name].id
  ip_cidr_range            = each.value.cidr
  private_ip_google_access = each.value.private_google_access
}

## SUBNETS PROXY ONLY ##
resource "google_compute_subnetwork" "proxy" {
  for_each = {
    for subnet in var.proxy_subnets :
    subnet.name => subnet
  }

  name          = each.value.name
  project       = each.value.project_id
  purpose       = "REGIONAL_MANAGED_PROXY"
  role          = "ACTIVE"
  region        = each.value.region
  ip_cidr_range = each.value.cidr
  network       = google_compute_network.vpc[each.value.vpc_name].id
}