# Define a list of emulation packages to install (from APT).
default['emulate']['packages'] = [
  'qemu',
  'libglib2.0-dev', # unicorn dependency
]
