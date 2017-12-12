#
# Cookbook Name:: 41h
# Recipe:: _base_ubuntu
#

# Ensure build tools are installed.
include_recipe 'apt'

# Remove MOTD bullshit we don't want.
[
  '/etc/update-motd.d/00-header',
  '/etc/update-motd.d/10-help-text',
  '/etc/update-motd.d/51-cloudguest',
  '/etc/update-motd.d/90-updates-available',
  '/etc/update-motd.d/97-overlayroot',
  '/etc/update-motd.d/91-release-upgrade',
  '/etc/update-motd.d/98-reboot-required',
  '/etc/update-motd.d/98-fsck-at-reboot',
].each do |motd|
  file motd do
    action :delete
  end
end

# Install MOTD.
template '/etc/update-motd.d/50-41h' do
  source 'motd.erb'
  owner 'root'
  group 'root'
  mode 00755
end

node['base']['packages']['ubuntu'].each do |p|
  package p do
    action :install
  end
end
