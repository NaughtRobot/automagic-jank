resource "linode_firewall_device" "hackthebox" {
    count       = length(linode_instance.hackthebox)
    firewall_id = linode_firewall.default.id
    entity_id = element(linode_instance.hackthebox.*.id, count.index)
}

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