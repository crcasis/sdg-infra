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

variable "labels" {
  type = map(string)
  default = {}
}