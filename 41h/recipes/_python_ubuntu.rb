#
# Cookbook Name:: 41h
# Recipe:: _python_ubuntu
#

node['debug']['packages']['ubuntu'].each do |p|
  package p do
    action :install
  end
end
