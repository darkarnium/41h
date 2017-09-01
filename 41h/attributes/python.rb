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
  'python-scipy',
  'python3-scipy',
  'python-parse',
  'python-scapy',
  'python-openssl',
  'python3-openssl',
  'python-crypto',
  'python3-crypto',
  'python-cryptography',
  'python3-cryptography',
  'python-six',
  'python3-six',
  'python-bs4',
  'python3-bs4',
  'python-scrapy',
  'python-pil',
  'python3-pil',
  'python-gmpy2',
  'python3-gmpy2',
  'python-mpmath',
  'python3-mpmath',
  'python-capstone',
  'python-requests',
  'python3-requests',
  'python-lzma',
  'python-pycparser',
  'python3-pycparser',
  'python-psutil',
  'python3-psutil',
  'python-ptrace',
  'python-pyelftools',
  'python3-pyelftools',
  'isort',
  'python3-isort',
]

# An array of Python packages to install on both versions (pip).
default['python']['pip-packages'] = [
  'cerberus',
]

# Python 2 packages to install.
default['python']['pip2-packages'] = [
  'pwntools',
]

# Install and configure Jupyter.
default['python']['jupyter']['install'] = true
default['python']['jupyter']['password'] = 'sha1:efda745d341f:7ec752099c133803ddb949e9e6534180a10c04b4'
