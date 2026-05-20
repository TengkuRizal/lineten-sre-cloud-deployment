variable "location" {
  description = "Azure region"
  type        = string
  default     = "southeastasia"
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "rg-lineten-sre-assessment"
}

variable "acr_name" {
  description = "Azure Container Registry name. Must be globally unique."
  type        = string
}

variable "container_image" {
  description = "Container image to deploy"
  type        = string
}

variable "app_name" {
  description = "Container App name"
  type        = string
  default     = "ca-lineten-sre-assessment"
}
