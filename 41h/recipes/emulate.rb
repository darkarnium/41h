#
# Cookbook Name:: 41h
# Recipe:: emulate
#

# Install emulate packages from apt.
node['emulate']['packages'].each do |p|
  package p do
    action :install
  end
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

directory '/opt/angr' do
  owner 'x41h'
  group node['system']['group']
  mode '0775'
  action :create
end

execute 'make-angr-virtualenv' do
  command 'virtualenv /opt/angr'
  creates '/opt/angr/bin'
end

execute 'install-angr' do
  command '/opt/angr/bin/pip install angr'
  user 'root'
  creates '/opt/angr/lib/python2.7/site-packages/angr'
end
