# Initial password for each user (force change on login).
default['system']['user']['initial_password'] = '$6$NwE7mNQ0$M9v988g02UwnSu9fHMqfLdihfkf8/lU6re98aZfJvy4.3VPBJW6rCkqoA5PZRQVvK7F0FHcKjuvFuxLY2JWbh/'

# Users and associated SSH public keys to authorize.
default['system']['users'] = [
  {
    'username' => '4f',
    'ssh_key' => '',
  },
  {
    'username' => 'svieg',
    'ssh_key' => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDPnaWNfV5NbbW83wiEQTJGE6tMbmlG6LUZFJNpyY2IlypBgbSVzm2jtCnQmanPBuaBxBMM3ygLlO+IkcUmMIWPvGWcfHa+cURzXe65sOX6uvK6cQl8egjmY5JPDWtbE1j6pNIQwioP7y3kWXxcELHMZoCLIrnniT2m3Gi5b3bprxbT6va9cy4GUuSXCil21ug0LR7FiTepynHoXfWVEbFvfZLgtofUYEQwuxu5g4+d9VC5aCuQ3g/rV4gcilbM3Ig6We2RgFckcq0qH+pz4raujnBLgchZhTQeg868eGNyCUxYmB9Y9C3K3B14TKuopJgqcPX+Byx59COSnsh+X75B Chef_Installed',
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
  },
  {
    'username' => 'w',
    'ssh_key' => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDSrKY1LxlFGdALmPgcRD9PjsIu7v55xWQRznVfriKN5vx+wvDdF3Oyn8tDSik1/8QeDDhaRiIR89cGFMbX9VI/WVrqDMDm/DHbNFbwMMG9/mAR48wt/Y+YU/Rjv39u128CySFOKXPiCTl8WHMDfhdD+4XZ7GxqgxpNGSiYdZCnv9uRrWBMgbqbDBEJkLrMf35HkFt1RPjUDaJl1jz8eBgTolemZ1+U7EKG120Jj8BrYcRAd3SX6h4CJmkAmhGAFWHVl6V++9dGB8knc4jt7qZGmDtW9dUhwvOxPPuVLWsoh51t0yfoxrU9QBM3jwaadtbup51Z6ifZUc9AaEnwZ7Jr Chef_Installed',
  },
  {
    'username' => 'zeiris',
    'ssh_key' => 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOT5daZ2d0+lWNgbu2GFi+5tUuNINX7uxGVGdrSsG8E3 Chef_Installed',
  },
  {
    'username' => 'jdoe',
    'ssh_key' => 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJqAaKQ7QrVV1qppTvs3Qa7gAi1QwY4Kyro2z2w3gHit Chef_Installed',
  },
  {
    'username' => 'burrito',
    'ssh_key' => 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEheii+6L83nEoyCkZ6a38Rj3VjezBJHYhehaSaSsDU9 Chef_Installed',
  },
  {
    'username' => 'roguesys',
    'ssh_key' => 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGRdp2c4PFoEOwQLc+vjQArBkXYJNvIPbP446YqVlTLK Chef_Installed',
  },
  {
    'username' => 'sum1',
    'ssh_key' => 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJrFnoCcsn7YWCO1rPvruODRdbp2nLPFjF1pF9N99cuE Chef_Installed',
  },
  {
    'username' => 'mongo',
    'ssh_key' => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCcq8kJIPajWrbtXm67Ly8fphQvC4QqZzmquFLhDx9X//m28dXD3XLHXMvnWmPdc6VlsLWxmHeni+zzdMw+GZ1edrxb2vGrlpzPN3hbLzjstvLSvBY0noSKkrV3uwDr/mj1CcdM5EwA0TRWmol8hJFkFyjCniXX3hmRTNz/hls0UjLv3n9orTy+/UgUyduK5yPXlBCXCduQKrBrY+u6aBfCwx/lI05AmLWREL8sgSSYI2gd7tAzi6bTRw+IyFf9tZubrIYEGQE/3llBhk2qsXr1KvERE/ke1/MAL5ZGLF21LksGU+tWVqs952Uku/T34Qlsr1V4Pu1kf67dPQ8bpPv1 Chef_Installed',
  },
]
