#
# Cookbook Name:: 41h
# Recipe:: debug
#

# Perform distribution specific operations.
case node['platform']
when 'ubuntu'
  include_recipe '41h::_debug_ubuntu'
when 'fedora', 'redhat', 'centos'
  include_recipe '41h::_debug_rhel'
end
