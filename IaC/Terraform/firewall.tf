resource "linode_firewall" "default" {
  label = "default"

  inbound {
    label    = "ssh"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "22"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound_policy  = "DROP"
  outbound_policy = "ACCEPT"
}

resource "linode_firewall" "private_network" {
  label = "private_network"

  inbound {
    label    = "all-private-tcp"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "1-6553"
    ipv4     = ["192.169.128.0/17"]
  }

  inbound {
    label    = "all-private-udp"
    action   = "ACCEPT"
    protocol = "UDP"
    ports    = "1-6553"
    ipv4     = ["192.169.128.0/17"]
  }

  inbound_policy  = "DROP"
  outbound_policy = "ACCEPT"
}

resource "linode_firewall_device" "hacking-lab-attack" {
  count       = length(linode_instance.hacking_lab_attack)
  firewall_id = linode_firewall.default.id
  entity_id   = element(linode_instance.hacking_lab_attack.*.id, count.index)
}

resource "linode_firewall_device" "hacking-lab-target" {
  count       = length(linode_instance.hacking_lab_target)
  firewall_id = linode_firewall.default.id
  entity_id   = element(linode_instance.hacking_lab_target.*.id, count.index)
}