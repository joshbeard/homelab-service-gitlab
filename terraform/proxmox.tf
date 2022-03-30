# https://registry.terraform.io/providers/Telmate/proxmox/latest/docs

# Proxmox API connection
variable "pm_api_url" {}
variable "pm_user" {}
variable "pm_tls_insecure" {}
variable "pm_password" {}

# The SSH credentials are used for uploading user data
variable "pm_ssh_host" {}
variable "pm_ssh_user" {}
variable "pm_ssh_pass" {}

terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
  }
}

provider "proxmox" {
    pm_api_url      = var.pm_api_url
    pm_user         = var.pm_user
    pm_password     = var.pm_password
    pm_tls_insecure = var.pm_tls_insecure
}
