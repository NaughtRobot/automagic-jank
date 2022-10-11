resource "linode_stackscript" "install_ansible" {
  label       = "Install Ansible"
  description = "Install Ansible and Configures Host"
  images      = [var.default_image, var.hacking_lab_image]
  rev_note    = "Initial Version"
  script      = <<EOF
#!/bin/bash

#<UDF name="NODE_ROLE" label="The node's role. Used during configuration.">
#<UDF name="HOST_NAME" label="Hostname to use for the node.">

set -e

# Save stdout and stderr
exec 6>&1
exec 5>&2

# Redirect stdout and stderr to a file
exec > /root/StackScript.out
exec 2>&1

DEBIAN_FRONTEND=noninteractive

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

hostname $HOST_NAME

git clone https://github.com/NaughtRobot/automagic-jank.git
ansible-playbook ./automagic-jank/CaC/Ansible/$NODE_ROLE.yml

# Restore stdout and stderr
exec 1>&6 6>&-
exec 2>&5 5>&-
EOF
}