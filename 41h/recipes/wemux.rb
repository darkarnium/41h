#
# Cookbook Name:: 41h
# Recipe:: wemux
#

# Only attempt to install wemux if it's actually present.
unless ::File.exist?('/opt/sources/wemux')
  Chef::Log.warn('Wemux sources directory does not exist, not installing!')
else
  link '/usr/bin/wemux' do
    to '/opt/sources/wemux/wemux'
  end

  # Create wemux configuration.
  directory '/usr/local/etc/' do
    mode '0755'
    owner 'root'
    group 'root'
    action :create
  end

  file '/usr/local/etc/wemux.conf' do
    mode '0644'
    owner 'root'
    action :create
    content 'host_groups=(4f)'
    notifies :run, 'execute[wemux-server]', :immediately
  end

  # Run wemux as 4f.
  execute 'wemux-server' do
    user '4f'
    action :nothing
    command '/usr/bin/wemux start'
  end

  # Ensure the wemux socket is writable.
  file '/tmp/wemux-wemux' do
    mode '1770'
    owner '4f'
    group '4f'
    action :create
  end
end
