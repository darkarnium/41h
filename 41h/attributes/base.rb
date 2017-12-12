# See distribution specific files.

# Force build-essential to be installed at Chef compile time.
override['build-essential']['compile_time'] = true

# Force environment variables for and builds.
default['make']['compiler-environment'] = {
  'HOME' => '/root',
  'USER' => 'root',
  'LANG' => 'en_US.UTF-8',
  'PATH' => [
    '/usr/local/sbin',
    '/usr/local/bin',
    '/usr/sbin',
    '/usr/bin',
    '/sbin',
    '/bin',
    '/usr/games',
    '/usr/local/games',
    '/snap/bin',
  ].join(':'),
}
