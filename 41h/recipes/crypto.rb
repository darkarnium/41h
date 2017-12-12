#
# Cookbook Name:: 41h
# Recipe:: crypto
#

# Build and install John.
execute 'build-configure-john' do
  cwd '/opt/sources/john/src'
  user 'root'
  command '/bin/bash ./configure'
  creates '/opt/sources/john/src/config.status'
  environment node['make']['compiler-environment']
end

execute 'build-make-john' do
  cwd '/opt/sources/john/src'
  user 'root'
  command 'make'
  creates '/opt/sources/john/run/john'
  environment node['make']['compiler-environment']
end

link '/usr/bin/john' do
  to '/opt/sources/john/run/john'
end
