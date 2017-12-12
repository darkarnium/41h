#
# Cookbook Name:: 41h
# Recipe:: _python_rhel
#

node['python']['packages']['rhel'].each do |p|
  package p do
    action :install
  end
end
