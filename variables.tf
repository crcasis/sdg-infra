## VPC ##

variable "region" {
  type = string
}

variable "hub_project_id" {
  type = string
}

# variable "fe_project_id" {
#   type = string
# }

# variable "be_project_id" {
#   type = string
# }

variable "vpcs" {
  type = list(object({
    name       = string
    project_id = string
  }))
}

variable "subnets" {
  type = list(object({
    name                  = string
    cidr                  = string
    region                = string
    private_google_access = bool
    vpc_name              = string
    project_id            = string
  }))
}

variable "proxy_subnets" {
  type = list(object({
    name       = string
    cidr       = string
    region     = string
    vpc_name   = string
    project_id = string
  }))
  default = []
}

# variable "apps_subnet_self_link" {
#   type = string
# }

# variable "network_self_link" {
#   type = string
# }

# variable "proxy_subnet_self_link" {
#   type = string
# }

