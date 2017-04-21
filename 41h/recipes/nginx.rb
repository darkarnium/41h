#
# Cookbook Name:: 41h
# Recipe:: nginx
#

# Ensure nginx is installed and running.
package 'nginx' do
  action :install
end

service 'nginx' do
  action [:enabled, :start]
end

# Install the landing page.
template '/usr/share/nginx/html/index.html' do
  mode '0644'
  owner 'root'
  source 'index.html.erb'
  action :create
  notifies :restart, 'service[nginx]', :delayed
end

# Install the landing configuration.
template '/etc/nginx/site-available/landing' do
  mode '0644'
  owner 'root'
  source 'landing.conf.erb'
  action :create
  notifies :restart, 'service[nginx]', :delayed
end

# Remove the default site.
file '/etc/nginx/sites-enabled/default' do
  action :delete
end
