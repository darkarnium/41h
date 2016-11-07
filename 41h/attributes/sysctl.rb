# Ensure the Kernel only swaps to avoid OOM.
default['sysctl']['params']['vm']['swappiness'] = 0

# Change the maximum number of sockets per process (ala `listen()`).
default['sysctl']['params']['net']['core']['somaxconn'] = 10_240

# Maximum packets allowed to queue when received faster than an interface can
# process them.
default['sysctl']['params']['core']['netdev_max_backlog'] = 2048

# Maximum 'backlogged' SYNs before the kernel starts dropping.
default['sysctl']['params']['net']['ipv4']['tcp_max_syn_backlog'] = 1024
default['sysctl']['params']['net']['ipv4']['tcp_syncookies'] = 1

# Increase the range of local ports to be used for client sockets.
default['sysctl']['params']['net']['ipv4']['ip_local_port_range'] = '2048 65000'

# Decrease the time before sockets in TIME_WAIT expire.
default['sysctl']['params']['net']['ipv4']['tcp_fin_timeout'] = 30

# Increase the maximum number of open files.
default['ulimit']['nofile']['soft'] = 81_920
default['ulimit']['nofile']['hard'] = 92_160
