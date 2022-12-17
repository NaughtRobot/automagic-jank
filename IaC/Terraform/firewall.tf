resource "linode_firewall" "web" {
  label = "web"

  inbound {
    label    = "ssh"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "22"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

    inbound {
    label    = "http"
    action   = "ACCEPT"
    protocol = "TCP"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

    inbound {
    label    = "https"
    action   = "ACCEPT"
    protocol = "TCP"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound_policy  = "DROP"
  outbound_policy = "ACCEPT"
}

resource "linode_firewall_device" "web" {
  count       = length(linode_instance.web)
  firewall_id = linode_firewall.web.id
  entity_id   = element(linode_instance.web.*.id, count.index)
}