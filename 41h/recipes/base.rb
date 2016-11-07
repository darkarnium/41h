#
# Cookbook Name:: 41h
# Recipe:: base
#

# Force an Apt run and ensure build-tools are installed.
include_recipe 'apt'
include_recipe 'build-essential::default'

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
# remove default MOTD bullshit we don't want
execute 'sudo rm /etc/update-motd.d/00-header'
execute 'sudo rm /etc/update-motd.d/10-help-text'
execute 'sudo rm /etc/update-motd.d/51-cloudguest'
execute 'sudo rm /etc/update-motd.d/90-updates-available'

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
