#
# Cookbook Name:: 41h
# Recipe:: base
#

# Install users, create homes and provision ssh keys.
node['system']['users'].each do |usr|
  user usr['username'] do
    home "/home/#{usr['username']}"
    shell '/bin/bash'
    group '4f'
    not_if "getent passwd #{usr['username']}"
    action :create
    username usr['username']
    password node['system']['user']['initial_password']
    manage_home true
  end

  # Expire passwords if the password hasn't yet been changed.
  execute "force-password-#{usr['username']}" do
    action :run
    only_if "egrep -i $(printf \"^#{usr['username']}.*%q\" \"#{node['system']['user']['initial_password']}\") /etc/shadow"
    command "chage -d 0 #{usr['username']}"
  end

  # Create relevant directories.
  directory "/home/#{usr['username']}/.ssh/" do
    owner usr['username']
    group '4f'
    mode '0750'
    action :create
  end

  # Install keys.
  file "/home/#{usr['username']}/.ssh/authorized_keys" do
    content usr['ssh_key']
    owner usr['username']
    mode '0600'
    action :create
  end
end
