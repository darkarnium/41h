#!/bin/sh -e
curl -L -s https://packages.chef.io/stable/ubuntu/12.04/chefdk_0.19.6-1_amd64.deb -o /tmp/chefdk_0.19.6-1_amd64.deb
dpkg -i /tmp/chefdk_0.19.6-1_amd64.deb
cd /tmp/provisioning
berks vendor
mkdir /tmp/chef
mv ./berks-cookbooks /tmp/chef/cookbooks
cd /tmp/chef/cookbooks
chef-client -z -o '41h::default'
