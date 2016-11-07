#
# Cookbook Name:: 41h
# Recipe:: python
#vagrant

# Actually install python+pip. Both versions.
include_recipe 'poise-python::default'

# Install python packages from apt.
node['python']['apt-packages'].each do |p|
  package p do
    action :install
  end
end

# Install python pip packages.
node['python']['pip-packages'].each do |p|
  # install for python2
  python_package p do
    python '2'
    action :install
  end
  # install for python3
  python_package p do
    python '3'
    action :install
  end
end

node['python']['pip2-packages'].each do |p|
  python_package p do
    python '2'
    action :install
  end
end
