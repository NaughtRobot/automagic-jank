data "linode_profile" "me" {}

resource "random_password" "password" {
  length  = 30
  special = true
}

resource "linode_instance" "web" {
  count          = var.web_vm_count
  label          = "web-${count.index}"
  image          = var.default_image
  region         = var.region
  type           = var.instance_type
  root_pass      = random_password.password.result
  stackscript_id = linode_stackscript.install_ansible.id
  stackscript_data = {
    "NODE_ROLE" = "web"
    "HOST_NAME" = "www-${count.index}.${linode_domain.nokarateinthepit_com.domain}"
  }
}