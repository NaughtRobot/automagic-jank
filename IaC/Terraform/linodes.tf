data "linode_profile" "me" {}

resource "random_password" "password" {
  length  = 30
  special = true
}

resource "linode_instance" "hacking_lab_attack" {
  count          = var.hacking_lab_attack_box_vm_count
  label          = "hacking-lab-attack-${count.index}"
  image          = var.hacking_lab_image
  region         = var.region
  type           = var.instance_type
  root_pass      = random_password.password.result
  stackscript_id = linode_stackscript.install_ansible.id
  stackscript_data = {
    "NODE_ROLE" = "hacking-lab-attack-box"
    "HOST_NAME" = "hacking-lab-attack-${count.index}.${linode_domain.naughtrobot_com.domain}"
  }
}

resource "linode_instance" "hacking_lab_target" {
  count          = var.hacking_lab_target_box_vm_count
  label          = "hacking-lab-target-${count.index}"
  image          = var.hacking_lab_image
  region         = var.region
  type           = var.instance_type
  root_pass      = random_password.password.result
  stackscript_id = linode_stackscript.install_ansible.id
  stackscript_data = {
    "NODE_ROLE" = "hacking-lab-target-box"
    "HOST_NAME" = "hacking-lab-target-${count.index}.${linode_domain.naughtrobot_com.domain}"
  }
}