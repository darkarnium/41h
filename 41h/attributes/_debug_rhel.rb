# Define a list of debug packages to install (from Yum).
default['debug']['packages']['rhel'] = [
  'gdb',
  'lldb',
  'java-1.8.0-openjdk',
]
