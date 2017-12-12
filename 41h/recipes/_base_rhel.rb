#
# Cookbook Name:: 41h
# Recipe:: _base_rhel
#

include_recipe 'yum'
include_recipe 'yum-epel'

# Enable SCL.
if node['platform'] == 'centos'
  package 'centos-release-scl' do
    action :install
  end
end

# Install MOTD.
template '/etc/motd' do
  source 'motd.erb'
  owner 'root'
  group 'root'
  mode 00755
end

node['base']['packages']['rhel'].each do |p|
  package p do
    action :install
  end
end
