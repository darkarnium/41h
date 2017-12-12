#
# Cookbook Name:: 41h
# Recipe:: base
#

# Ensure build tools are installed.
include_recipe 'build-essential::default'

# Apply all sysctl values from attributes.
include_recipe 'sysctl::apply'

# Basic system sanity.
include_recipe 'ntp::default'

# Perform distribution specific operations.
case node['platform']
when 'ubuntu'
  include_recipe '41h::_base_ubuntu'
when 'fedora', 'redhat', 'centos'
  include_recipe '41h::_base_rhel'
end

# Ensure group exists.
group node['system']['group'] do
  action :create
end

# Ensure user exists.
user node['system']['user'] do
  action [:create, :lock]
  group node['system']['group']
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
