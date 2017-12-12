#
# Cookbook Name:: 41h
# Recipe:: _firewall_rhel
#

# Stop and remove UFW.
service 'firewalld' do
  action [:stop, :disable]
end

package 'firewalld' do
  action :purge
end

# Use 'iptables-services' to reload firewall at boot.
package 'iptables-services' do
  action :install
end

# Install iptables / ip6tables configuration.
template '/etc/sysconfig/iptables' do
  source 'iptables.erb'
  owner 'root'
  mode '0600'
  action :create
  notifies :restart, 'service[iptables]', :immediately
end

template '/etc/sysconfig/ip6tables' do
  source 'ip6tables.erb'
  owner 'root'
  mode '0600'
  action :create
  notifies :restart, 'service[ip6tables]', :immediately
end

# Ensure services are configured properly.
service 'iptables' do
  action [:start, :enable]
end

service 'ip6tables' do
  action [:start, :enable]
end
