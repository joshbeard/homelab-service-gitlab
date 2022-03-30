# Deployment of my GitLab server to Proxmox

module "gitlab_vm" {
  source = "git::https://code.home.jbeard.dev/homelab/platform/terraform/terraform-proxmox-vm.git?ref=jbeard.dev"
  vm_name                      = "gitlab"
  vm_description               = "GitLab Server (Ubuntu) - code.home.jbeard.dev\n\nCreated with Terraform; Managed with Ansible"
  memory                       = 8192
  cores                        = 2
  primary_network_cidr_address = "10.0.13.6/24"
  primary_network_gateway      = "10.0.13.1"
  template_clone               = "template-ubuntu-20.04-server-latest"
  template_full_clone          = false
  fqdn                         = "gitlab.home.jbeard.dev"
  cloud_init_os                = "ubuntu"
  vm_boot_order                = "cdn"


  # Proxmox options
  proxmox_node                 = "proxmox"
  qemu_os                      = "l26"
  vm_start_on_boot             = true
  # Proxmox SSH config for copying user data
  proxmox_ssh_host = var.pm_ssh_host
  proxmox_ssh_user = var.pm_ssh_user
  proxmox_ssh_pass = var.pm_ssh_pass

  disks = [
    {
      type    = "scsi"
      size    = "200G"
      storage = "store"
    }
  ]

}

output "vm_id" {
  value = module.gitlab_vm.vm_id
}

output "vm_name" {
  value = module.gitlab_vm.vm_name
}
