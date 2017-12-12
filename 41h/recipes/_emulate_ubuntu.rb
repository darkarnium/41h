#
# Cookbook Name:: 41h
# Recipe:: _emulate_ubuntu

node['emulate']['packages']['ubuntu'].each do |p|
  package p do
    action :install
  end
end
