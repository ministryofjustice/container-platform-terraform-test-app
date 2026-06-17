variable "gateway_name" {
  type        = string
  description = "Name of the Gateway resource that the HTTPRoute should reference"
  default     = ""

  validation {
    condition     = !var.enable_httproute || trimspace(var.gateway_name) != ""
    error_message = "gateway_name must be set when enable_httproute is true."
  }
}

variable "gateway_namespace" {
  type        = string
  description = "Namespace of the Gateway resource that the HTTPRoute should reference"
  default     = ""

  validation {
    condition     = !var.enable_httproute || trimspace(var.gateway_namespace) != ""
    error_message = "gateway_namespace must be set when enable_httproute is true."
  }
}

variable "hostnames" {
  type        = list(string)
  description = "Hostnames for the HTTPRoute"
  default     = []

  validation {
    condition     = !var.enable_httproute || (length(var.hostnames) > 0 && alltrue([for hostname in var.hostnames : trimspace(hostname) != ""]))
    error_message = "hostnames must contain at least one non-empty hostname when enable_httproute is true."
  }
}

variable "namespace" {
  type        = string
  description = "Namespace to create for the test app"
  default     = "test-app"
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
