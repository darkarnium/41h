#
# Cookbook Name:: 41h
# Recipe:: ruby
#

# Install python packages from apt.
node['ruby']['gems'].each do |g|
  gem_package g do
    action :install
  end
end
