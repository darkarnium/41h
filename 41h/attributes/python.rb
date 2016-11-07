# Ensure Poise installs Python2, Python3 and Pypy
override['poise-python']['install_python2'] = true
override['poise-python']['install_python3'] = true
override['poise-python']['install_pypy'] = true

# An array of Python packages to install (pip).
default['python']['packages'] = [
  'python-parse',
  'cerberus',
  'binwalk'
]
