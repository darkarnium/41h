#
# Cookbook Name:: 41h
# Recipe:: recon
#

# Setup Go environment variables.
environment = {
  'GOPATH' => '/opt/sources/go/'
}

# Install gobuster.
unless ::File.exist?('/opt/sources/go/src/gobuster/gobuster')
  execute 'go-get-gobuster' do
    cwd '/opt/sources/go/src/gobuster'
    action :run
    command 'go get'
    environment environment
  end

  execute 'go-build-gobuster' do
    cwd '/opt/sources/go/src/gobuster'
    action :run
    command 'go build'
    environment environment
  end

  link '/opt/sources/go/src/gobuster/gobuster' do
    to '/usr/bin/gobuster'
  end
end
