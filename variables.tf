variable "gateway_name" {
  type        = string
  description = "Name of the Gateway resource that the HTTPRoute should reference"
}

variable "gateway_namespace" {
  type        = string
  description = "Namespace of the Gateway resource that the HTTPRoute should reference"
}
