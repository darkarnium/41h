# Define a list of emulation packages to install (from APT).
default['emulate']['packages']['ubuntu'] = [
  'qemu',
  'libglib2.0-dev', # unicorn dependency
]
