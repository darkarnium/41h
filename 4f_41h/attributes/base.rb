# Force an apt-get run at Chef compile time.
override['apt']['compile_time_update'] = true

# Force build-essential to be installed at Chef compile time.
override['build-essential']['compile_time'] = true

# Define a list of base packages to install (in generic repositories).
default['base']['packages'] = [
  'vim-nox'
]
