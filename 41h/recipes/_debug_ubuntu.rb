#
# Cookbook Name:: 41h
# Recipe:: _debug_ubuntu

node['debug']['packages']['ubuntu'].each do |p|
  package p do
    action :install
  end
end

# Build and install pwndbg.
execute 'build-make-pwndbg' do
  cwd '/opt/sources/pwndbg'
  user 'root'
  action :run
  not_if { ::File.exist?('/opt/sources/pwndbg/.built') }
  only_if { ::File.exist?('/opt/sources/pwndbg') }
  command './setup.sh'
end

# As pwndbg doesn't appear to create anything we can use to track installation
# in its own directory, create a '.built' file and use that to track whether
# installation has run or not.
file '/opt/sources/pwndbg/.built' do
  mode '0755'
  owner 'root'
  group 'root'
  action :create
  content ''
  only_if { ::File.exist?('/opt/sources/pwndbg') }
end

# Install pwndbg for all users.
node['system']['users'].each do |u|
  file "/home/#{u['username']}/.gdbinit" do
    mode 00640
    owner u['username']
    content 'source /opt/sources/pwndbg/gdbinit.py'
    only_if { ::File.exist?('/opt/sources/pwndbg') }
  end
end
