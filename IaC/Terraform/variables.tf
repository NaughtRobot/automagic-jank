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

variable "mysterium_image" {
  description = "Instnace OS"
  type        = string
  default     = "linode/ubuntu22.04"
}

variable "hacking_image" {
  description = "Instnace OS"
  type        = string
  default     = "linode/ubuntu22.04"
}

variable "hacking_vm_count" {
  description = "Number of hacking VMs to create"
  type        = number
  default     = 0
}

variable "mysterium_uk_node_count" {
  description = "Number of Mysterium VMs to create in the UK"
  type        = number
  default     = 0
}