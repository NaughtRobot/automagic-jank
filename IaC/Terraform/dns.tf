resource "linode_domain" "nokarateinthepit_com" {
  type        = "master"
  domain      = "nokarateinthepit.com"
  soa_email   = "naughtrobot@pm.me"
  ttl_sec     = "300"
  expire_sec  = "300"
  refresh_sec = "300"
}

resource "linode_domain_record" "A-root" {
  count       = length(linode_instance.web)
  domain_id   = linode_domain.nokarateinthepit_com.id
  name        = ""
  record_type = "A"
  target      = element(linode_instance.web.*.ip_address, count.index)
}

resource "linode_domain_record" "AAAA-root" {
  count       = length(linode_instance.web)
  domain_id   = linode_domain.nokarateinthepit_com.id
  name        = ""
  record_type = "AAAA"
  target      = trimsuffix(element(linode_instance.web.*.ipv6, count.index), "/128")
}

resource "linode_domain_record" "A-web" {
  count       = length(linode_instance.web)
  domain_id   = linode_domain.nokarateinthepit_com.id
  name        = element(linode_instance.web.*.label, count.index)
  record_type = "A"
  target      = element(linode_instance.web.*.ip_address, count.index)
}

resource "linode_domain_record" "AAAA-web" {
  count       = length(linode_instance.web)
  domain_id   = linode_domain.nokarateinthepit_com.id
  name        = element(linode_instance.web.*.label, count.index)
  record_type = "AAAA"
  target      = trimsuffix(element(linode_instance.web.*.ipv6, count.index), "/128")
}

resource "linode_domain_record" "CNAME-web" {
  domain_id  = linode_domain.nokarateinthepit_com.id
  name = "www"
  record_type = "CNAME"
  target = linode_domain.nokarateinthepit_com.domain
}