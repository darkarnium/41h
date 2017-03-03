# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/xenial64'
  config.vm.box_check_update = true

  # http -> localhost:8000
  # ssh  -> localhost:2222
  config.vm.network 'forwarded_port', guest: 80, host: 8000

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Mount scratch directory and Chef cookbook(s).
  config.vm.synced_folder './scratch', '/scratch'

  config.vm.provider 'virtualbox' do |vb|
    vb.gui = false
    vb.memory = '2048'
  end

  # Bus the provisioning cookbook to the machine.
  config.vm.provision 'file', source: './41h', destination: '/tmp/provisioning/'

  # Kick off chef.
  config.vm.provision 'shell', path: 'provision.sh' 
end
