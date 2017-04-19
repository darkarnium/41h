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
  config.vm.provision 'shell', inline: <<-SHELL
    # Install ChefDK.
    curl -L -s https://packages.chef.io/stable/ubuntu/12.04/chefdk_0.19.6-1_amd64.deb -o /tmp/chefdk_0.19.6-1_amd64.deb
    dpkg -i /tmp/chefdk_0.19.6-1_amd64.deb

    # Create the Chef zero repository.
    cd /tmp/provisioning
    berks vendor
    mkdir /tmp/chef
    mv ./berks-cookbooks /tmp/chef/cookbooks
    cd /tmp/chef/cookbooks

    # Enable password authentication for ssh and kick off Chef.
    echo '{ "ssh": { "password_authentication": true } }' >> /tmp/chef/chef.json
    chmod 600 /tmp/chef/chef.json
    chef-client -z -o '41h::default' -j /tmp/chef/chef.json
  SHELL
end
