# Initial password for each user (force change on login).
default['system']['user']['initial_password'] = '$6$yAKWsT68$idXMD6Vv4JRmr6FjiNa6DdqfBm78xVD18TzhBbEPs3KR9m6muM.0VAVPvFIHAQLjzHvjOA/FCLvENFoRgQLtd.'
default['system']['group'] = 'x41h'

# Users and associated SSH public keys to authorize.
default['system']['users'] = [
  {
    'username' => 'x41h',
    'ssh_key' => ''
  },
  {
    'username' => 'darkarnium',
    'ssh_key' => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCvgSx3fdxC7KK3zIMNCimrSe8hJgWON0IqTJqRdGQGAhxkwWMVD/I0+IfUSTN7YTTOQL2YyW8N/8RihXcHQjCDHcal5ELfjeqcrdpEh9XT9JyTeZed4VEz9I+w1iHiMN4bIQFUFZyJzqO2e25oknRQqu0sxVApkSNrNTTiGy3/3eDjnHnQg3wsJPk7+yI/LBvRUQhaSxuZME9N2IH+b4vqHL297MMDmAuX4aaEsR8zrOgEh8piSnwbFaqLZZEfXowyROjBIozAeoSNzSmTk21amYPmNj3MueO/rpWDejKcp9CEqmaDQLVv9oZljS7Q/6a8521EKPGJ3WF822yB2wNp Chef_Installed',
  },
]
