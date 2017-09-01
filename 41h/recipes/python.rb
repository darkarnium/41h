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

# Install Jypyter, if required.
# TODO: This is fairly static, including paths, and no venv. Fix?
if node['python']['jupyter']['install']
  python_package 'jupyter' do
    python '3'
    action :upgrade
  end

  user 'jupyter' do
    shell '/bin/false'
    action :create
    manage_home true
  end

  ['/home/jupyter/.jupyter/', '/home/jupyter/notebooks'].each do |d|
    directory d do
      owner 'jupyter'
      mode '0755'
      action :create
    end
  end

  template '/etc/systemd/system/jupyter.service' do
    source 'jupyter.service.erb'
    owner 'root'
    mode '0664'
    action :create
  end

  service 'jupyter' do
    action [:enable]
  end

  template '/home/jupyter/.jupyter/jupyter_notebook_config.py' do
    source 'jupyter_notebook_config.py.erb'
    owner 'jupyter'
    mode '0600'
    action :create
    notifies :restart, 'service[jupyter]', :delayed
  end
end
