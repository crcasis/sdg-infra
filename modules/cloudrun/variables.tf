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

variable "env_vars" {
  type    = map(string)
  default = {}
}

variable "load_balancer_sa" {
  type = string
}

variable "labels" {
  type = map(string)
  default = {}
}