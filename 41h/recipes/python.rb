#
# Cookbook Name:: 41h
# Recipe:: python
#

# Install python packages from apt.
node['python']['packages'].each do |p|
  package p do
    action :install
  end
end

execute "easy_install pip" do
  action :run
end

execute "easy_install3 pip" do
  action :run
end

# Install python 2.X and 3.X pip packages.
node['python']['pip-packages'].each do |p|
  execute "pip install #{p}" do
    action :run
  end

  execute "pip3 install #{p}" do
    action :run
  end
end

# Install python 2.X pip packages.
node['python']['pip2-packages'].each do |p|
  execute "pip install #{p}" do
    action :run
  end
end

# Install Jypyter, if required.
# TODO: This is fairly static, including paths, and no venv. Fix?
if node['python']['jupyter']['install']
  execute "pip3 install jupyter" do
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
