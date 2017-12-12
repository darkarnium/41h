#
# Cookbook Name:: 41h
# Recipe:: _nginx_ubuntu
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
