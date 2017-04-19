# Management subnets to permitt SSH traffic from.
default['iptables']['management'] = [
  '0.0.0.0/0'
]

# Define ruby interpreter to use for rebuild-iptables.
default['iptables']['system_ruby'] = '/usr/bin/ruby'