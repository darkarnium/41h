#
# Cookbook Name:: 41h
# Recipe:: nginx
#

# Perform distribution specific operations.
case node['platform']
when 'ubuntu'
  include_recipe '41h::_nginx_ubuntu'
when 'fedora', 'redhat', 'centos'
  include_recipe '41h::_nginx_rhel'
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
