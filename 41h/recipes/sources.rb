#
# Cookbook Name:: 41h
# Recipe:: base
#

# Create parent directory.
directory '/opt/sources' do
  mode 00755
  recursive true
  action :create
end

# Install all source packages from their relevant types (git, etc).
node['sources']['packages'].each do |k, v|
  case v[:type]
  when 'git'
    git "/opt/sources/#{k}" do
      repository v[:uri]
      reference v[:ref]
      action :sync
    end
  end
end
