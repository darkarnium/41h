# Define a list of ruby packages to install (from APT).
default['ruby']['packages']['ubuntu'] = [
  'ruby-dev',
]

# The default environment should be used under Ubuntu.
default['ruby']['environment']['ubuntu'] = {}
