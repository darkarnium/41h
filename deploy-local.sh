#!/bin/sh -e

# Install ChefDK.
curl -L -s https://packages.chef.io/stable/ubuntu/12.04/chefdk_0.19.6-1_amd64.deb -o /tmp/chefdk_0.19.6-1_amd64.deb
dpkg -i /tmp/chefdk_0.19.6-1_amd64.deb

# Create the Chef zero repository.
cd /tmp/provisioning
berks vendor
mkdir /tmp/chef
mv ./berks-cookbooks /tmp/chef/cookbooks
cd /tmp/chef/cookbooks

# Enable password authentication for ssh and kick off Chef.
echo '{ "ssh": { "password_authentication": true } }' >> /tmp/chef/chef.json
chmod 600 /tmp/chef/chef.json
chef-client -z -o '41h::default' -j /tmp/chef/chef.json