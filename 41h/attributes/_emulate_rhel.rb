# Define a list of emulation packages to install (from Yum).
default['emulate']['packages']['rhel'] = [
  'qemu',
  'glib2-devel',  # unicorn dependency
]
