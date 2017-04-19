#
# Cookbook Name:: 41h
# Recipe:: sources
#

# Create parent directory.
directory '/opt/sources/go/src' do
  mode 00755
  recursive true
  action :create
end

# Install all source packages from their relevant types.
node['sources']['packages'].each do |k, v|
  case v[:type]
  when 'git-general'
    git "/opt/sources/#{k}" do
      repository v[:uri]
      reference v[:ref]
      action :sync
    end
  when 'git-go'
    git "/opt/sources/go/src/#{k}" do
      repository v[:uri]
      reference v[:ref]
      action :sync
    end
  end
end
