variable "name" {
  type        = string
  description = "Name of product"
}

variable "enable_sg" {
  type = bool
  default = false
  description = "Habilitar funcionalidade de criação do SG"
}

variable "ingress_ports" {
  type = list(number)
  default = []
  description = "lista de portas a serem liberadas"   
}