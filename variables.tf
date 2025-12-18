variable "rg-name" {
  type        = string
  description = "The name of the resource group"
  default     = "rg-3"
}

variable "location" {
  type        = string
  description = "Location where the resources are deployed"
  default     = "West Europe"
}

variable "vnet-name" {
  type        = string
  description = "The name of the virtual network"
  default     = "vnet-3"
}

variable "subnet-name" {
  type        = string
  description = "The name of the subnet in which the resources are"
  default     = "subnet-3"
}

variable "nsg-name" {
  type        = string
  description = "The name of the security group"
  default     = "nsg-3"
}

variable "nic-name" {
  type        = string
  description = "The name of the network interface"
  default     = "nic-3"
}
