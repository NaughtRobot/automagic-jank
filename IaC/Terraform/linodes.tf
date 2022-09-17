data "linode_profile" "me" {}

resource "linode_instance" "vm" {
  count            = 3
  label            = "hackthebox-${count.index}"
  image            = var.image
  region           = var.region
  type             = var.instance_type
  authorized_users = [data.linode_profile.me.username]
  stackscript_id   = linode_stackscript.install_ansible.id
  stackscript_data = {
    "NODE_LABEL" = "hackthebox-${count.index}"
  }
}