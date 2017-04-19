# Force an apt-get run at Chef compile time.
override['apt']['compile_time_update'] = true

# Force build-essential to be installed at Chef compile time.
override['build-essential']['compile_time'] = true

# Force environment variables for and builds.
default['make']['compiler-environment'] = {
  'HOME' => '/root',
  'USER' => 'root',
  'LANG' => 'en_US.UTF-8',
  'PATH' => [
    '/usr/local/sbin',
    '/usr/local/bin',
    '/usr/sbin',
    '/usr/bin',
    '/sbin',
    '/bin',
    '/usr/games',
    '/usr/local/games',
    '/snap/bin',
  ].join(':'),
}

# Define a list of base packages to install (from APT).
default['base']['packages'] = [
  'git',
  'cmake',
  'ruby',
  'htop',
  'curl',
  'wget',
  'tmux',
  'socat',
  'lolcat',
  'golang',
  'netcat',
  'vim-nox',
  'libedit-dev',
  'pkg-config',
  'binutils',
  'subversion',
  'fortune-mod',
  'nginx', # to proxy ipython notebook and stuff
  'openssl',
  'libssl-dev',
  'valgrind',
  'z3',
  'thefuck',
  'tcptraceroute',
  'john',
  'nmap',
]
