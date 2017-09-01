#
# Cookbook Name:: 41h
# Recipe:: base
#

# Install users, create homes and provision ssh keys.
node['system']['users'].each do |usr|
  user usr['username'] do
    home "/home/#{usr['username']}"
    shell '/bin/bash'
    group node['system']['group']
    not_if "getent passwd #{usr['username']}"
    action :create
    username usr['username']
    password node['system']['user']['initial_password']
    manage_home true
    notifies :run, "execute[force-password-#{usr['username']}]", :immediately
  end

  # Expire passwords if the account is new.
  execute "force-password-#{usr['username']}" do
    action :nothing
    command "chage -d 0 #{usr['username']}"
  end

  # Create relevant directories.
  directory "/home/#{usr['username']}/.ssh/" do
    owner usr['username']
    node['system']['group']
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
