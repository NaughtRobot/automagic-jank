resource "linode_stackscript" "install_ansible" {
  label       = "Hack The Box Setup"
  description = "Install Ansible and Configure Host"
  images      = ["linode/ubuntu22.04"]
  rev_note    = "Initial Version"
  script      = <<EOF
#!/bin/bash

#<UDF name="NODE_ROLE" label="The node's role. Used during configuration.">

if [ -f /etc/apt/sources.list ]; then
   apt update
   apt -y install ansible
elif [-f /etc/yum.conf ]; then
   yum -y install ansible
elif [-f /etc/pacman.conf ]; then
   pacman -Sy
   pacman -S --noconfirm pacman
   pacman -S --noconfirm ansible
else
   echo "Your distribution is not supported by this StackScript"
   exit
fi

git clone https://github.com/NaughtRobot/automagic-jank.git
ansible-playbook ./automagic-jank/CaC/Ansible/$NODE_ROLE.yml

EOF
}