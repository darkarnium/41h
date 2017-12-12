#!/bin/sh -e

# Install Chef.
if [ ! -f /tmp/chef-install.sh ]; then
  curl -L https://omnitruck.chef.io/install.sh -o /tmp/chef-install.sh
  bash /tmp/chef-install.sh
fi

# Clean up chef cache.
if [ -d /root/.chef/local-mode-cache ]; then
  rm -rf /root/.chef/local-mode-cache
fi

# Install Berkshelf dependencies.
if [ -e /etc/debian_version ]; then
  apt-get -y update
  apt-get -y install build-essential ruby-dev
fi
if [ -e /etc/redhat-release ]; then
  yum -y update
  yum -y groupinstall "Development Tools"
fi

# Install Berkshelf.
/opt/chef/embedded/bin/gem install berkshelf

# Create the Chef zero repository.
cd /tmp/provisioning/41h
/opt/chef/embedded/bin/berks vendor
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
