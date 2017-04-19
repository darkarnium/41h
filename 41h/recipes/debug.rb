#
# Cookbook Name:: 41h
# Recipe:: debug
#

# Install debug packages from apt.
node['debug']['packages'].each do |p|
  package p do
    action :install
  end
end

# Install pwndbg if it's present.
if ::File.exist?('/opt/sources/pwndbg')
  # Build and install pwndbg.
  execute 'build-make-pwndbg' do
    cwd '/opt/sources/pwndbg'
    user 'root'
    action :run
    command './setup.sh'
  end

  # Install pwndbg for all users.
  node['system']['users'].each do |u|
    file "/home/#{u['username']}/.gdbinit" do
      content 'source /opt/sources/pwndbg/gdbinit.py'
      owner u['username']
      mode 00640
    end
  end
end