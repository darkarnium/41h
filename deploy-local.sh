#!/bin/sh -e

# Install ChefDK.
if [ ! -f /tmp/chefdk_0.19.6-1 ]; then
    curl -L -s https://packages.chef.io/stable/ubuntu/12.04/chefdk_0.19.6-1_amd64.deb -o /tmp/chefdk_0.19.6-1_amd64.deb
    dpkg -i /tmp/chefdk_0.19.6-1_amd64.deb
fi
    
# Create the Chef zero repository.
cd /tmp/provisioning
berks vendor
mkdir -p /tmp/chef

if [ -d /tmp/chef/cookbooks ]; then
    rm -rf /tmp/chef/cookbooks
fi
mv ./berks-cookbooks /tmp/chef/cookbooks
cd /tmp/chef/cookbooks

# Enable password authentication for ssh and kick off Chef.
if [ ! -f /tmp/chef/chef.json ]; then
    echo '{ "ssh": { "password_authentication": true } }' > /tmp/chef/chef.json
fi
chmod 600 /tmp/chef/chef.json
chef-client -z -o '41h::default' -j /tmp/chef/chef.json
