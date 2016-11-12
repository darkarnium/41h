node['emulate']['packages'].each do |p|
  package p do
    action :install
  end
end

# build unicorn
execute 'sudo ./make.sh' do
  cwd '/opt/sources/unicorn'
  creates '/usr/lib/libunicorn.so'
end
execute 'sudo ./make.sh install' do
  cwd '/opt/sources/unicorn'
  creates '/usr/lib/libunicorn.so'
end
execute 'sudo make install' do
  cwd '/opt/sources/unicorn/bindings/python'
end
execute 'sudo make install3' do
  cwd '/opt/sources/unicorn/bindings/python'
end
