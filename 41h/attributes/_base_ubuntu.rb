# Force an apt-get run at Chef compile time.
override['apt']['compile_time_update'] = true

# Define a list of base packages to install (from APT).
default['base']['packages']['ubuntu'] = [
  'git',
  'cmake',
  'ruby',
  'htop',
  'curl',
  'wget',
  'tmux',
  'socat',
  'golang',
  'netcat',
  'vim-nox',
  'libedit-dev',
  'pkg-config',
  'binutils',
  'subversion',
  'fortune-mod',
  'nginx',
  'openssl',
  'libssl-dev',
  'valgrind',
  'tcptraceroute',
  'nmap',
]
