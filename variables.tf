variable "gateway_name" {
  type        = string
  description = "Name of the Gateway resource that the HTTPRoute should reference"
}

variable "gateway_namespace" {
  type        = string
  description = "Namespace of the Gateway resource that the HTTPRoute should reference"
}

variable "enable_httproute" {
  type    = bool
  default = false
}

variable "image_repository" {
  type        = string
  description = "Container image repository"
}

variable "image_tag" {
  type        = string
  description = "Container image tag"
  default     = "1.0.0"
}
