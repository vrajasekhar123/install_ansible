#/bin/bash

apt-get update -y &>/dev/null
apt-get install -y software-properties-common &>/dev/null

#Add repository
apt-add-repository -y ppa:ansible/ansible &>/dev/null
repo_details=$(grep "deb " /etc/apt/sources.list.d/ansible-ubuntu-ansible-xenial.list)
echo -e "Apt repository added to the system\n$repo_details"
apt-get update -y &>/dev/null
echo "Apt repository updated"

#Install latest version of Ansible
apt-get install -y ansible &>/dev/null

#Diasable host key checking
sed -i s/"#host_key_checking = False"/"host_key_checking = False"/g /etc/ansible/ansible.cfg
echo "Host kay has been disabled in ansible"

ansible_version=$(ansible --version | grep "^ansible " | awk '{ print $2 }')

echo "Ansible installation completed with version:- $ansible_version"
