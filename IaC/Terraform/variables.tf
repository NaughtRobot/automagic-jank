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

variable "default_image" {
  description = "Default OS Image"
  type        = string
  default     = "linode/ubuntu22.04"
}

variable "web_vm_count" {
  description = "Number of hacking lab attack VMs to create"
  type        = number
  default     = 0
}