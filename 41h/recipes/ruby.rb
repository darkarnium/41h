#
# Cookbook Name:: 41h
# Recipe:: ruby
#

# Perform distribution specific operations.
case node['platform']
when 'ubuntu'
  include_recipe '41h::_ruby_ubuntu'
when 'fedora', 'redhat', 'centos'
  include_recipe '41h::_ruby_rhel'
end
