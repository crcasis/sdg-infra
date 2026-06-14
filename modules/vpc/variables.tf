variable "region" {
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
    project_id            = string # <--- Corregido: Ahora Terraform sí reconocerá este atributo
  }))
}

variable "proxy_subnets" {
  type = list(object({
    name       = string
    cidr       = string
    region     = string
    vpc_name   = string
    project_id = string # <--- Añadido también aquí por consistencia con tus recursos
  }))
  default = []
}