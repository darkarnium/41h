#
# Cookbook Name:: 41h
# Recipe:: recon
#

# Setup Go environment variables.
environment = {
  'GOPATH' => '/opt/sources/go/',
}

# Install gobuster.
execute 'go-get-gobuster' do
  cwd '/opt/sources/go/src/gobuster'
  action :run
  not_if { ::File.exist?('/opt/sources/go/src/gobuster/gobuster') }
  command 'go get'
  environment environment
end

execute 'go-build-gobuster' do
  cwd '/opt/sources/go/src/gobuster'
  action :run
  not_if { ::File.exist?('/opt/sources/go/src/gobuster/gobuster') }
  command 'go build'
  environment environment
end

link '/opt/sources/go/src/gobuster/gobuster' do
  to '/usr/bin/gobuster'
end
