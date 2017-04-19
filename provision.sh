#!/bin/bash

# Fetch and install Chef.
curl -L https://omnitruck.chef.io/install.sh | sudo bash
/opt/chef/embedded/bin/gem install berkshelf

# Install a deployment key for the 41h cookbook.
mkdir /root/.ssh/
echo -n '<GITHUB_DEPLOYMENT_KEY_HERE>' | base64 -d > /root/.ssh/41h-startup.pem
chmod 600 /root/.ssh/41h-startup.pem

# Check-out the environment cookbook.
GIT_SSH_COMMAND="ssh -i /root/.ssh/41h-startup.pem -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no" git clone git@github.com:darkarnium/41h.git /tmp/provisioning

# Create the Chef zero repository.
cd /tmp/provisioning
berks vendor
mkdir /tmp/chef
mv ./berks-cookbooks /tmp/chef/cookbooks
cd /tmp/chef/cookbooks

# Kick off chef.
chmod 600 /tmp/chef/chef.json
chef-client -z -o '41h::default' -j /tmp/chef/chef.json