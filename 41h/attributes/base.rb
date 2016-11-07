# Force an apt-get run at Chef compile time.
override['apt']['compile_time_update'] = true

# Force build-essential to be installed at Chef compile time.
override['build-essential']['compile_time'] = true

# Define a list of base packages to install (in generic repositories).
default['base']['packages'] = [
  # General *Nix shit.
  'git',
  'gdb',
  'curl',
  'tmux',
  'socat',
  'lolcat',
  'netcat',
  'vim-nox',
  'subversion',
  'fortune-mod',

  # Python and friends.
  'ipython',
  'python-pip',

  'valgrind',

  # Capstone.
  'python-capstone',
  'libcapstone3',
  'libcapstone-dev',

  # Radare.
  'radare2',
  'libradare2-dev'
]
