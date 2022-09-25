resource "linode_firewall_device" "hacking" {
  count       = length(linode_instance.hacking)
  firewall_id = linode_firewall.default.id
  entity_id   = element(linode_instance.hacking.*.id, count.index)
}

resource "linode_firewall_device" "mysterium" {
  count       = length(linode_instance.mysterium-uk-node)
  firewall_id = linode_firewall.mysterium-uk.id
  entity_id   = element(linode_instance.mysterium-uk-node.*.id, count.index)
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

resource "linode_firewall" "mysterium-uk" {
  label = "mysterium_uk"

  inbound {
    label    = "ssh"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "22"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "mysterium"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "4449"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "mysterium-vpn"
    action   = "ACCEPT"
    protocol = "UDP"
    ports    = "10000-60000"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound_policy  = "DROP"
  outbound_policy = "ACCEPT"
}