resource "linode_domain" "nokarateinthepit_com" {
  type        = "master"
  domain      = "nokarateinthepit.com"
  soa_email   = "naughtrobot@pm.me"
  ttl_sec     = "300"
  expire_sec  = "300"
  refresh_sec = "300"
}

# NOT IN USE
resource "linode_domain" "naughtrobot_com" {
  type        = "master"
  domain      = "naughtrobot.com"
  soa_email   = "naughtrobot@pm.me"
  ttl_sec     = "300"
  expire_sec  = "300"
  refresh_sec = "300"
}

resource "linode_domain_record" "A-hackin-lab-attack" {
  count       = length(linode_instance.hacking_lab_attack)
  domain_id   = linode_domain.naughtrobot_com.id
  name        = element(linode_instance.hacking_lab_attack.*.label, count.index)
  record_type = "A"
  target      = element(linode_instance.hacking_lab_attack.*.ip_address, count.index)
}

resource "linode_domain_record" "AAAA-hacking-lab-attack" {
  count       = length(linode_instance.hacking_lab_attack)
  domain_id   = linode_domain.naughtrobot_com.id
  name        = element(linode_instance.hacking_lab_attack.*.label, count.index)
  record_type = "AAAA"
  target      = trimsuffix(element(linode_instance.hacking_lab_attack.*.ipv6, count.index), "/128")
}

resource "linode_domain_record" "A-hackin-lab-target" {
  count       = length(linode_instance.hacking_lab_target)
  domain_id   = linode_domain.naughtrobot_com.id
  name        = element(linode_instance.hacking_lab_target.*.label, count.index)
  record_type = "A"
  target      = element(linode_instance.hacking_lab_target.*.ip_address, count.index)
}

resource "linode_domain_record" "AAAA-hacking-lab-target" {
  count       = length(linode_instance.hacking_lab_target)
  domain_id   = linode_domain.naughtrobot_com.id
  name        = element(linode_instance.hacking_lab_target.*.label, count.index)
  record_type = "AAAA"
  target      = trimsuffix(element(linode_instance.hacking_lab_target.*.ipv6, count.index), "/128")
}