#
# Cookbook Name:: 41h
# Recipe:: wemux
#

# Only attempt to install wemux if it's actually present.
link '/usr/bin/wemux' do
  to '/opt/sources/wemux/wemux'
  notifies :run, 'execute[wemux-server]', :delayed
end

# Create wemux configuration.
directory '/usr/local/etc/' do
  mode '0755'
  owner 'root'
  group 'root'
  action :create
end

template '/usr/local/etc/wemux.conf' do
  source 'wemux.conf.erb'
  mode '0644'
  owner 'root'
  action :create
end

# Ensure the wemux socket is writable.
file '/tmp/wemux-wemux' do
  mode '1770'
  owner '4f'
  group '4f'
  not_if { ::File.exist?('/tmp/wemux-wemux') }
  action :create
end

# Run wemux in server mode.
execute 'wemux-server' do
  user '4f'
  action :nothing
  not_if 'ps aux | grep -i [w]emux'
  command 'wemux background'
end
