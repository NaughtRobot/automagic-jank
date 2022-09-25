data "linode_profile" "me" {}

resource "random_password" "password" {
  length  = 30
  special = true
}

resource "linode_instance" "hacking" {
  count          = var.hacking_vm_count
  label          = "hacking-${count.index}"
  image          = var.hacking_image
  region         = var.region
  type           = var.instance_type
  root_pass      = random_password.password.result
  stackscript_id = linode_stackscript.install_ansible.id
  stackscript_data = {
    "NODE_ROLE" = "hacking"
  }
}

resource "linode_instance" "mysterium-uk-node" {
  count          = var.mysterium_uk_node_count
  label          = "mysterium-uk-${count.index}"
  image          = var.mysterium_image
  region         = "eu-west"
  type           = var.instance_type
  root_pass      = random_password.password.result
  stackscript_id = linode_stackscript.install_ansible.id
  stackscript_data = {
    "NODE_RODE" = "mysterium"
  }
}