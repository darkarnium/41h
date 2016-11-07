# Ensure Poise installs Python2 and Python3
override['poise-python']['install_python2'] = true
override['poise-python']['install_python3'] = true

# Python-related apt packages to install.
default['python']['apt-packages'] = [
  'ipython',
  'ipython-notebook',
  'ipython3',
  'ipython3-notebook',
  'python-numpy',
  'python3-numpy',
  'python-parse'
]

# An array of Python packages to install (pip).
default['python']['pip-packages'] = [
  'cerberus',
  'scrapy',
  'six',
  'beautifulsoup4',
  'binwalk',
  'pwntools'
]
