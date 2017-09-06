#
# Cookbook Name:: 41h
# Recipe:: nginx
#

# Ensure nginx is installed and running.
package 'nginx' do
  action :install
end

service 'nginx' do
  action [:enable, :start]
  supports [:restart, :stop, :start]
end

# Install the landing page.
template '/var/www/html/index.html' do
  mode '0644'
  owner 'root'
  source 'index.html.erb'
  action :create
end

# Install the landing configuration.
template '/etc/nginx/sites-available/landing' do
  mode '0644'
  owner 'root'
  source 'landing.conf.erb'
  action :create
  notifies :restart, 'service[nginx]', :delayed
end

# Remove the default site.
file '/etc/nginx/sites-enabled/default' do
  action :delete
  notifies :restart, 'service[nginx]', :delayed
end

# Link in the landing page.
link '/etc/nginx/sites-enabled/landing' do
  to '/etc/nginx/sites-available/landing'
  notifies :restart, 'service[nginx]', :delayed
end
