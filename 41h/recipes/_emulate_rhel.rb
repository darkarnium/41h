#
# Cookbook Name:: 41h
# Recipe:: _emulate_rhel
#

node['emulate']['packages']['rhel'].each do |p|
  package p do
    action :install
  end
end
