#
# Cookbook Name:: 41h
# Recipe:: _debug_ubuntu

node['debug']['packages']['ubuntu'].each do |p|
  package p do
    action :install
  end
end

# Install ruby packages from Rubygems.
node['ruby']['gems'].each do |g|
  # gem_package has not been used here as the ability to set environment
  # variables is required to use SCL Ruby on RHEL / CentOS.
  execute "gem-#{g}" do
    action :run
    command "gem install #{g}"
    environment node['ruby']['environment']['ubuntu']
  end
end
