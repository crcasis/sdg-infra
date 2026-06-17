## VPC ##

variable "region" {
  type = string
}

variable "hub_project_id" {
  type = string
}

variable "fe_project_id" {
  type = string
}

variable "be_project_id" {
  type = string
}

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


variable "service_name" {
  type = string
}

variable "image" {
  type = string
}

variable "env_vars" {
  type = map(string)
}

variable "labels" {
  type = map(string)
}