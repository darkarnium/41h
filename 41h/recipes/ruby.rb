#
# Cookbook Name:: 41h
# Recipe:: ruby
#

# Install ruby packages from apt.
node['ruby']['packages'].each do |p|
  package p do
    action :install
  end
end

# Install ruby packages from Rubygems.
node['ruby']['gems'].each do |g|
  gem_package g do
    action :install
  end
end
