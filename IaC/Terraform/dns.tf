resource "linode_domain" "naughtrobot_com" {
  type        = "master"
  domain      = "naughtrobot.com"
  soa_email   = "naughtrobot@pm.me"
  ttl_sec     = "300"
  expire_sec  = "300"
  refresh_sec = "300"
}

resource "linode_domain_record" "A-hacking" {
  count       = length(linode_instance.hacking)
  domain_id   = linode_domain.naughtrobot_com.id
  name        = element(linode_instance.hacking.*.label, count.index)
  record_type = "A"
  target      = element(linode_instance.hacking.*.ip_address, count.index)
}

resource "linode_domain_record" "AAAA-hacking" {
  count       = length(linode_instance.hacking)
  domain_id   = linode_domain.naughtrobot_com.id
  name        = element(linode_instance.hacking.*.label, count.index)
  record_type = "AAAA"
  target      = trimsuffix(element(linode_instance.hacking.*.ipv6, count.index), "/128")
}
