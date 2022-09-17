resource "linode_domain" "naughtrobot_com" {
  type      = "master"
  domain    = "naughtrobot.com"
  soa_email = "naughtrobot@pm.me"
}