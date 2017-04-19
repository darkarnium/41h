Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/xenial64'
  config.vm.box_check_update = true

  # http -> localhost:8000
  # ssh  -> localhost:2222
  config.vm.network 'forwarded_port', guest: 80, host: 8000

  # Mount scratch directory and Chef cookbook(s).
  config.vm.synced_folder './scratch', '/scratch'

  config.vm.provider 'virtualbox' do |vb|
    vb.gui = false
    vb.memory = '2048'
  end

  # Bus the provisioning cookbook to the machine.
  config.vm.provision 'file', source: './41h', destination: '/tmp/provisioning/'

  # Provision the VM with Chef.
  config.vm.provision 'shell', path: 'deploy-local.sh'
end
