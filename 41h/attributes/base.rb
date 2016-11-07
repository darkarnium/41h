# Force an apt-get run at Chef compile time.
override['apt']['compile_time_update'] = true

# Force build-essential to be installed at Chef compile time.
override['build-essential']['compile_time'] = true

# Define a list of base packages to install (in generic repositories).
default['base']['packages'] = [
  'git',
  'gdb',
  'curl',
  'wget',
  'tmux',
  'socat',
  'lolcat',
  'netcat',
  'vim-nox',
  'subversion',
  'fortune-mod',
  'nginx',  # to proxy ipython notebook and stuff
  'openssl',
  'libssl-dev',
  'libsodium-dev',
  'valgrind',
  'z3',

  # Capstone.
  'python-capstone',
  'libcapstone3',
  'libcapstone-dev',

  # Radare.
  'radare2',
  'libradare2-dev'
]
