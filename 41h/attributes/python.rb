# See distribution specific files.

# An array of Python packages to install on both versions (pip).
default['python']['pip-packages'] = [
  'thefuck',
  'cerberus',
  'numpy',
  'scipy',
  'pyOpenssl',
  'pycrypto',
  'cryptography',
  'six',
  'beautifulsoup4',
  'Scrapy',
  'gmpy2',
  'mpmath',
  'requests',
  'pylzma',
  'pycparser',
  'psutil',
  'pyelftools',
  'isort',
]

# Python 2 packages to install.
default['python']['pip2-packages'] = [
  'parse',
  'pwntools',
  'scapy',
  'ptrace',
]

# Python 3 packages to install.
default['python']['pip3-packages'] = [
  'ipython',
  'Pillow',
]

# Install and configure Jupyter.
default['python']['jupyter']['install'] = true
default['python']['jupyter']['password'] = 'sha1:efda745d341f:7ec752099c133803ddb949e9e6534180a10c04b4'
