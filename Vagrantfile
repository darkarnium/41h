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

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder './scratch', '/scratch'
  config.vm.synced_folder './41h', '/mnt/provisioning', mount_options: ['ro']

  config.vm.provider 'virtualbox' do |vb|
    vb.gui = false
    vb.memory = '2048'
  end

  # Kick off chef.
  config.vm.provision 'shell', inline: <<-SHELL
    curl -L https://omnitruck.chef.io/install.sh | sudo bash -- -v 12.15.19
    cd /mnt/provisioning
    chef-client -z -o '41h::base,41h::sources'
  SHELL
end
