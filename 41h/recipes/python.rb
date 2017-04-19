#
# Cookbook Name:: 41h
# Recipe:: python

# Install python and pip.
include_recipe 'poise-python::default'

# Install python packages from apt.
node['python']['apt-packages'].each do |p|
  package p do
    action :install
  end
end

# Install python 2.X and 3.X pip packages.
node['python']['pip-packages'].each do |p|
  python_package p do
    python '2'
    action :install
  end

  python_package p do
    python '3'
    action :install
  end
end

# Install python 2.X pip packages.
node['python']['pip2-packages'].each do |p|
  python_package p do
    python '2'
    action :install
  end
end
