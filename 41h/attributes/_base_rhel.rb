# Define a list of base packages to install (from Yum).
default['base']['packages']['rhel'] = [
  'git',
  'cmake',
  'ruby',
  'htop',
  'curl',
  'wget',
  'tmux',
  'socat',
  'golang',
  'nmap-ncat',
  'vim-enhanced',
  'libffi-devel',
  'libedit-devel',
  'pkgconfig',
  'binutils',
  'subversion',
  'fortune-mod',
  'nginx',
  'openssl',
  'openssl-devel',
  'valgrind',
  'traceroute',
  'nmap',
  'openblas-devel',
  'lapack-devel',
  'gmp-devel',
  'mpfr-devel',
  'libmpc-devel',
]
