#
# Cookbook Name:: 41h
# Recipe:: firewall
#

# Perform distribution specific operations.
case node['platform']
when 'ubuntu'
  include_recipe '41h::_firewall_ubuntu'
when 'fedora', 'redhat', 'centos'
  include_recipe '41h::_firewall_rhel'
end
