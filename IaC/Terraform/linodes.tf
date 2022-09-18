data "linode_profile" "me" {}

resource "random_password" "password" {
  length  = 30
  special = true
}

resource "linode_instance" "hackthebox" {
  count            = var.hacking_vm_count
  label            = "hackthebox-${count.index}"
  image            = var.image
  region           = var.region
  type             = var.instance_type
  root_pass        = random_password.password.result
  authorized_users = [data.linode_profile.me.username]
  stackscript_id   = linode_stackscript.install_ansible.id
  stackscript_data = {
    "NODE_ROLE" = "hackthebox"
  }
}