#
# Cookbook Name:: 41h
# Recipe:: base
#

# If running under Ubuntu / Debian, ensure apt-get update is run.
case node['platform']
when 'ubuntu', 'debian'
  include_recipe 'apt'
end

# Ensure build tools are installed.
include_recipe 'build-essential::default'

# Apply all sysctl values from attributes.
include_recipe 'sysctl::apply'

# Basic system sanity.
include_recipe 'ntp::default'

# Ensure group exists.
group node['system']['group'] do
  action :create
end

# Create scratch if it doesn't exist.
directory '/scratch/' do
  owner 'root'
  group node['system']['group']
  mode '0775'
  action :create
end

# Configure sshd and install banners.
service 'sshd' do
  action [:enable, :start]
end

template '/etc/ssh/sshd_config' do
  source 'sshd_config.erb'
  owner 'root'
  mode '0600'
  action :create
  notifies :restart, 'service[sshd]', :immediately
end

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
  source '41h-motd.sh.erb'
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

# Setup tmux.
template '/etc/tmux.conf' do
  source 'tmux.conf.erb'
  owner 'root'
  mode '0644'
  action :create
end

# Install sudoers.
template '/etc/sudoers.d/99-41h' do
  source 'sudoers.erb'
  owner 'root'
  mode '0755'
  action :create
end

# Install PS1 profile.d file.
template '/etc/profile.d/ps1.sh' do
  source 'ps1.sh.erb'
  owner 'root'
  mode '0755'
  action :create
end

# Install new bashrc skel.
template '/etc/skel/.bashrc' do
  source 'bashrc.erb'
  owner 'root'
  mode '0644'
  action :create
end

# Install global vim configuration.
template '/etc/vimrc' do
  source 'vimrc.erb'
  owner 'root'
  mode '0644'
  action :create
end

# Install base packages from apt.
node['base']['packages'].each do |p|
  package p do
    action :install
  end
end
