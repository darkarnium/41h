# Check various kernel tuneables are set.
describe kernel_parameter('net.core.somaxconn') do
  its('value') { should eq 10_240 }
end

describe kernel_parameter('net.core.netdev_max_backlog') do
  its('value') { should eq 2048 }
end

describe kernel_parameter('net.ipv4.tcp_max_syn_backlog') do
  its('value') { should eq 1024 }
end

describe kernel_parameter('net.ipv4.tcp_syncookies') do
  its('value') { should eq 1 }
end

# The '\t' (tab) is required in place of space due to the way the value is
# printed.
describe kernel_parameter('net.ipv4.ip_local_port_range') do
  its('value') { should eq "2048\t65000" }
end

describe kernel_parameter('net.ipv4.tcp_fin_timeout') do
  its('value') { should eq 30 }
end
