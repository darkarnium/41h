Vagrant.configure('2') do |config|
  config.vm.box = 'generic/ubuntu1604'
  config.vm.box_check_update = true

  # Bus the provisioning cookbook to the machine.
  config.vm.provision 'file', source: './41h', destination: '/tmp/provisioning/'

  # Provision the VM with Chef.
  config.vm.provision 'shell', path: 'deploy-local.sh'

  # Disable SMB1 backed shared folders.
  config.vm.synced_folder ".", "/vagrant", disabled: true
end
