# apache

Automate the installation and configuration using Chef for package httpd.
few test cases has been  validated  using Kitchen commands.

Chef Development Kit Version: 2.3.4
chef-client version: 13.4.19
berks version: 6.3.1
kitchen version: 1.17.0
inspec version: 1.36.1

# Install docker on Ubuntu
apt-get install docker.io
systemctl start docker
systemctl enable docker

# Install ruby gem 
apt-get install gem

# Install kitchen-docker
chef gem install kitchen-docker


