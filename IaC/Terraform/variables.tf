variable "api_token" {
  description = "Linode API Token"
  type        = string
  sensitive   = true
}

variable "instance_type" {
  description = "Linode Instnace Type"
  type        = string
  default     = "g6-nanode-1"
}

variable "region" {
  description = "Linode Region"
  type        = string
  default     = "us-west"
}

variable "image" {
  description = "Instnace OS"
  type        = string
  default     = "linode/ubuntu22.04"
}