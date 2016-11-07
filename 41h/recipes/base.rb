#
# Cookbook Name:: 41h
# Recipe:: base
#

# Force an Apt run and ensure build-tools are installed.
include_recipe 'apt'
include_recipe 'build-essential::default'

# Ensure Python is installed.
include_recipe 'poise-python::default'

# Apply all sysctl values from attributes.
include_recipe 'sysctl::apply'

# Basic system sanity.
include_recipe 'ntp::default'

# Install MOTD.
template '/etc/update-motd.d/50-4f' do
  source '4f-motd.sh.erb'
  owner 'root'
  group 'root'
  mode 00755
end

# Install ulimit configuration.
template '/etc/security/limits.d/base.conf' do
  source 'ulimit-nofile.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

# Install base packages.
node['base']['packages'].each do |p|
  package p do
    action :install
  end
end
