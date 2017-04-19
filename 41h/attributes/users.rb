# Users and associated SSH public keys to authorize.
default['system']['users'] = [
  {
    'username' => '4f',
    'ssh_key' => '',
  },
  {
    'username' => 'yrp',
    'ssh_key' => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDSixyTdhTkCv7jlxqRRx74Z0Evg/EzBLlP/FhMsggC/zyUZ4IEL3I/sUV3zMMLHe6vOa6L37KOTRUfIVGmvMRiAZhJQQOc9/Mm/ZPWyYOmdEuOTVmUomTTAKbikmmWVIeB2T50t115RqpWy5mzcJvggrtMQTMRxpLTbpbNdANTtsIFJfCpdJfLJuFSh7ViXZBwpI62iI7gNSUcf5NJcV784NXCjCR7DtXFTud5zzr3o+jaj4hkT3jcWJPpkG9WSnUOxbDmfqeezGcwiGHSoX7QH38SjN7WG9p//0iaBQGHFgniMPEewHzicGAap9zXVUxP2cwRBDTtmTO4YBozGzMF Chef_Installed',
  },
  {
    'username' => 'bsmt',
    'ssh_key' => 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKVOHykT+en0JQsHqX1jFySQyqfFzHaBXxOXdRTg29oY Chef_Installed',
  },
  {
    'username' => 'darkarnium',
    'ssh_key' => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCvgSx3fdxC7KK3zIMNCimrSe8hJgWON0IqTJqRdGQGAhxkwWMVD/I0+IfUSTN7YTTOQL2YyW8N/8RihXcHQjCDHcal5ELfjeqcrdpEh9XT9JyTeZed4VEz9I+w1iHiMN4bIQFUFZyJzqO2e25oknRQqu0sxVApkSNrNTTiGy3/3eDjnHnQg3wsJPk7+yI/LBvRUQhaSxuZME9N2IH+b4vqHL297MMDmAuX4aaEsR8zrOgEh8piSnwbFaqLZZEfXowyROjBIozAeoSNzSmTk21amYPmNj3MueO/rpWDejKcp9CEqmaDQLVv9oZljS7Q/6a8521EKPGJ3WF822yB2wNp Chef_Installed',
  }
]
