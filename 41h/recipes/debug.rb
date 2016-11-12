node['debug']['packages'].each do |p|
  package p do
    action :install
  end
end

# "install" pwndbg
template '/home/4f/.gdbinit' do
  source 'gdbinit'
  owner '4f'
  group '4f'
  mode 00775
end
