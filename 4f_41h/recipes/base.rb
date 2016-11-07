#
# Cookbook Name:: 4f_41h
# Recipe:: base
#

include_recipe 'apt'
include_recipe 'build-essential::default'

# Install all base packages.
node['base']['packages'].each do |p|
  package p do
    action :install
  end
end
