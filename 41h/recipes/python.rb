#
# Cookbook Name:: 41h
# Recipe:: python
#

# Perform distribution specific operations.
case node['platform']
when 'ubuntu'
  include_recipe '41h::_python_ubuntu'
when 'fedora', 'redhat', 'centos'
  include_recipe '41h::_python_rhel'
end

# This is a hack around an issue with pluggy and setuptools under CentOS.
#   - Ref: https://github.com/pypa/pip/issues/4104
execute 'pip-setuptools' do
  command "pip install -I 'setuptools==30.1.0'"
  action :run
end

# Install python 2.X and 3.X pip packages.
node['python']['pip-packages'].each do |p|
  execute "pip-#{p}" do
    command "pip install #{p}"
    action :run
  end
  execute "pip-#{p}" do
    command "pip3 install #{p}"
    action :run
  end
end

# Install python 2.X pip packages.
node['python']['pip2-packages'].each do |p|
  execute "pip-#{p}" do
    command "pip install #{p}"
    action :run
  end
end

# Install python 3.X pip packages.
node['python']['pip3-packages'].each do |p|
  execute "pip-#{p}" do
    command "pip3 install #{p}"
    action :run
  end
end

# Install Jypyter, if required.
# TODO: This is fairly static, including paths, and no venv. Fix?
if node['python']['jupyter']['install']
  execute 'pip-jupyter' do
    command 'pip3 install jupyter'
    action :run
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
