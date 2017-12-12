#
# Cookbook Name:: 41h
# Recipe:: _firewall_ubuntu
#

# Stop and remove UFW.
service 'ufw' do
  action [:stop, :disable]
end

package 'ufw' do
  action :purge
end

# Use 'iptables-persistent' to reload firewall at boot.
package 'iptables-persistent' do
  action :install
end

# Install iptables / ip6tables configuration.
directory '/etc/iptables/' do
  owner 'root'
  group 'root'
  mode '0700'
  action :create
end

template '/etc/iptables/rules.v4' do
  source 'iptables.erb'
  owner 'root'
  mode '0600'
  action :create
  notifies :run, 'execute[reload-iptables-rules]', :immediately
end

template '/etc/iptables/rules.v6' do
  source 'ip6tables.erb'
  owner 'root'
  mode '0600'
  action :create
  notifies :run, 'execute[reload-ip6tables-rules]', :immediately
end

# Reload iptables configuration, when asked.
execute 'reload-iptables-rules' do
  command 'iptables-restore < /etc/iptables/rules.v4'
  action :nothing
end

execute 'reload-ip6tables-rules' do
  command 'ip6tables-restore < /etc/iptables/rules.v6'
  action :nothing
end
