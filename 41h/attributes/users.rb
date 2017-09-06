# Initial password for each user (force change on login).
default['system']['user']['initial_password'] = '$6$yAKWsT68$idXMD6Vv4JRmr6FjiNa6DdqfBm78xVD18TzhBbEPs3KR9m6muM.0VAVPvFIHAQLjzHvjOA/FCLvENFoRgQLtd.'
default['system']['group'] = 'x41h'

# Users and associated SSH public keys to authorize.
default['system']['users'] = [
  {
    'username' => 'x41h',
    'ssh_key' => ''
  },
  # {
  #   'username' => 'MY_USER',
  #   'ssh_key' => 'ssh-xxxx AAAAAMY_SSH_PUBKEY Chef_Installed',
  # },
]
