#
# Cookbook Name:: 41h
# Recipe:: emulate
#

# Perform distribution specific operations.
case node['platform']
when 'ubuntu'
  include_recipe '41h::_emulate_ubuntu'
when 'fedora', 'redhat', 'centos'
  include_recipe '41h::_emulate_rhel'
end

# Build and install unicorn.
execute 'build-make-unicorn' do
  cwd '/opt/sources/unicorn'
  user 'root'
  command '/bin/bash ./make.sh'
  creates '/usr/lib/libunicorn.so'
  environment node['make']['compiler-environment']
end

execute 'build-install-unicorn' do
  cwd '/opt/sources/unicorn'
  user 'root'
  command './make.sh install'
  creates '/usr/lib/libunicorn.so'
  notifies :run, 'execute[build-install-unicorn-python-bindings]', :immediately
  environment node['make']['compiler-environment']
end

# Install unicorn Python bindings.
execute 'build-install-unicorn-python-bindings' do
  cwd '/opt/sources/unicorn/bindings/python'
  user 'root'
  action :nothing
  command 'make install'
  notifies :run, 'execute[build-install-unicorn-python3-bindings]', :immediately
  environment node['make']['compiler-environment']
end

execute 'build-install-unicorn-python3-bindings' do
  cwd '/opt/sources/unicorn/bindings/python'
  user 'root'
  action :nothing
  command 'make install3'
  environment node['make']['compiler-environment']
end

# Install Angr.
directory '/opt/angr' do
  owner node['system']['user']
  group node['system']['group']
  mode '0775'
  action :create
end

execute 'build-make-angr-virtualenv' do
  user node['system']['user']
  command 'virtualenv /opt/angr'
  creates '/opt/angr/bin'
  environment(
    'HOME': "/home/#{node['system']['user']}/"
  )
end

execute 'build-install-angr' do
  user node['system']['user']
  command '/opt/angr/bin/pip install angr'
  creates '/opt/angr/lib/python2.7/site-packages/angr'
  environment(
    'HOME': "/home/#{node['system']['user']}/"
  )
end
