#
# Cookbook Name:: 41h
# Recipe:: assembly
#

# Install asm packages from apt.
node['asm']['packages'].each do |p|
  package p do
    action :install
  end
end

# Build keystone.
directory '/opt/sources/keystone/build' do
  owner 'root'
  group '4f'
  mode '0775'
  action :create
end

execute 'build-make-keystone' do
  cwd '/opt/sources/keystone/build'
  user 'root'
  command [
    'cmake',
    '-DCMAKE_BUILD_TYPE=Release',
    '-DBUILD_SHARED_LIBS=ON',
    '-DLLVM_TARGETS_TO_BUILD="X86;ARM;Mips;AArch64"',
    '-G "Unix Makefiles"',
    '..',
  ].join(' ')
  creates '/opt/sources/keystone/build/CMakeLists.txt'
end

execute 'build-install-keystone' do
  cwd '/opt/sources/keystone/build'
  user 'root'
  command 'make install'
  creates '/usr/local/lib/libkeystone.so'
  notifies :run, 'execute[build-install-keystone-python-bindings]', :immediately
end

# Install Keystone python bindings.
execute 'build-install-keystone-python-bindings' do
  cwd '/opt/sources/keystone/bindings/python'
  user 'root'
  action :nothing
  command 'make install'
  notifies :run, 'execute[build-install-keystone-python3-bindings]', :immediately
end

execute 'build-install-keystone-python3-bindings' do
  cwd '/opt/sources/keystone/bindings/python'
  user 'root'
  action :nothing
  command 'make install3'
end

# Build Rappel.
execute 'sudo make' do
  cwd '/opt/sources/rappel'
  user 'root'
  command 'make'
  creates '/usr/sources/rappel/bin/rappel'
end

link '/usr/bin/rappel' do
  to '/usr/sources/rappel/bin/rappel'
end
