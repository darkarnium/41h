# Assembler/disassembler related things.

node['asm']['packages'].each do |p|
  package p do
    action :install
  end
end

# build keystone
execute 'sudo mkdir build' do
  cwd '/opt/sources/keystone'
  creates '/opt/sources/keystone/build'
end
execute 'sudo cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON -DLLVM_TARGETS_TO_BUILD="X86;ARM;Mips;AArch64" -G "Unix Makefiles" ..' do
  cwd '/opt/sources/keystone/build'
  creates '/opt/sources/keystone/build/CMakeLists.txt'
end
execute 'sudo make install' do
  cwd '/opt/sources/keystone/build'
  creates '/usr/local/lib/libkeystone.so'
end
execute 'sudo make install' do
  cwd '/opt/sources/keystone/bindings/python'
  creates '/usr/local/lib/libkeystone.so'
end
execute 'sudo make install3' do
  cwd '/opt/sources/keystone/bindings/python'
  creates '/usr/local/lib/libkeystone.so'
end

# build rappel
execute 'sudo make' do
  cwd '/opt/sources/rappel'
  creates '/usr/bin/rappel'
end
execute 'sudo cp bin/rappel /usr/bin/rappel' do
  cwd '/opt/sources/rappel'
  creates '/usr/bin/rappel'
end
