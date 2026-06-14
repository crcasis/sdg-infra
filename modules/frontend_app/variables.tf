variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "service_name" {
  type = string
}

variable "image" {
  type = string
}

variable "allow_unauthenticated" {
  type    = bool
  default = false
}

variable "env_vars" {
  type    = map(string)
  default = {}
}

variable "bucket_name" {
  type = string
}

variable "apps_subnet_self_link" {
  type = string
}

variable "network_self_link" {
  type = string
}

variable "proxy_subnet_self_link" {
  type = string
}
