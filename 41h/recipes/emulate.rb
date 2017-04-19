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
