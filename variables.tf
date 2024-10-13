variable "rancher_url" {
  description = "Rancher URL for Helm and Kubernetes providers to connect to"
  type        = string
}

variable "rancher_token" {
  description = "Rancher Token for Helm and Kubernetes providers to connect to"
  type        = string
}

variable "cluster" {
  description = "Cluster for artemis operator broker deployment"
  type        = string
  default     = null
}

variable "project" {
  description = "Project for artemis operator broker deployment"
  type        = string
  default     = null
}

variable "namespace" {
  description = "Namespace for artemis operator broker deployment"
  type        = string
  default     = null
}

variable "extra_values" {
  description = "Extra Helm values for artemis operator broker helm deployment"
  type        = string
  default     = null
}

