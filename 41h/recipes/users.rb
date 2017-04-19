#
# Cookbook Name:: 41h
# Recipe:: base
#

# Install users, create homes and provision ssh keys.
node['system']['users'].each do |usr|
  user usr['username'] do
    home "/home/#{usr['username']}"
    password '$6$NwE7mNQ0$M9v988g02UwnSu9fHMqfLdihfkf8/lU6re98aZfJvy4.3VPBJW6rCkqoA5PZRQVvK7F0FHcKjuvFuxLY2JWbh/'
    group '4f'
    shell '/bin/bash'
    action :create
    username usr['username']
    manage_home true
    notifies :run, "execute[force-password-#{usr['username']}]", :immediately
  end

  # Expire passwords immediately.
  execute "force-password-#{usr['username']}" do
    command "chage -d 0 #{usr['username']}"
    action :nothing
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
