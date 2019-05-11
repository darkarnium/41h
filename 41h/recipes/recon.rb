#
# Cookbook Name:: 41h
# Recipe:: recon
#

# Setup Go environment variables.
environment = {
  'GOPATH' => '/opt/sources/go/',
}

# Install gobuster.
#execute 'go-get-gobuster' do
#  cwd '/opt/sources/go/src/gobuster'
#  action :run
#  not_if { ::File.exist?('/opt/sources/go/bin/gobuster') }
#  command 'go get'
#  environment environment
#end
#
#execute 'go-build-gobuster' do
#  cwd '/opt/sources/go/src/gobuster'
#  action :run
#  not_if { ::File.exist?('/opt/sources/go/bin/gobuster') }
#  command 'go build'
#  environment environment
#end
#
link '/usr/bin/gobuster' do
  to '/opt/sources/go/bin/gobuster'
end

# Install recon packages from apt.
node['recon']['packages'].each do |p|
  package p do
    action :install
  end
end
