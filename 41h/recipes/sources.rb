#
# Cookbook Name:: 41h
# Recipe:: base
#

# Install all source packages from their relevant types (git, etc).
node['sources']['packages'].each do |k, v|
  case v[:type]
  when 'git'
    git "/opt/#{k}" do
      repository v[:uri]
      reference v[:ref]
      action :sync
    end
  end
end
