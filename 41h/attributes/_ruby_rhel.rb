# Define a list of ruby packages to install (from Yum).
default['ruby']['packages']['rhel'] = [
  'ruby-devel',
  'rh-ruby23',
  'rh-ruby23-ruby-devel',
]

# Setup the environment variables to use SCL Ruby 2.3 - as above.
default['ruby']['environment']['rhel'] = {
  'PATH' => [
    '/opt/rh/rh-ruby23/root/usr/bin',
    '/usr/local/bin',
    '/usr/bin',
    '/usr/local/sbin',
    '/usr/sbin',
  ].join(':'),
  'LD_LIBRARY_PATH' => [
    '/opt/rh/rh-ruby23/root/usr/local/lib64',
    '/opt/rh/rh-ruby23/root/usr/lib64',
  ].join(':'),
  'PKG_CONFIG_PATH' => [
    '/opt/rh/rh-ruby23/root/usr/local/lib64/pkgconfig',
    '/opt/rh/rh-ruby23/root/usr/lib64/pkgconfig',
  ].join(':'),
}
