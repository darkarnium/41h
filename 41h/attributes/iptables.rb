# Management subnets to permitt SSH traffic from.
default['iptables']['management'] = [
  '0.0.0.0/0',
]

# Traffic to permit.
default['iptables']['permit'] = [
  {
   'port' => '80',
   'source' => '0.0.0.0/0',
   'protocol' => 'tcp',
  }
]
