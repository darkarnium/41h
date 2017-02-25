# Unicorn commit ref / release and source.
default['sources']['packages']['unicorn'] = {
  type: 'git',
  uri: 'https://github.com/unicorn-engine/unicorn.git',
  ref: 'a2edc1852d862dcfbf88866a3a26a9f5b2bdf037'
}

# Keystone commit ref / release and source.
default['sources']['packages']['keystone'] = {
  type: 'git',
  uri: 'https://github.com/keystone-engine/keystone.git',
  ref: 'ae94ae9e645f81df1cf3d27e323e78c3023cdfe4'
}

# Ropgadget commit ref / release and source.
default['sources']['packages']['ropgadget'] = {
  type: 'git',
  uri: 'https://github.com/JonathanSalwan/ROPgadget.git',
  ref: '282d8516f21c85b17cab95165620bb4009cc68a0'
}

# Villoc commit ref / release and source.
default['sources']['packages']['villoc'] = {
  type: 'git',
  uri: 'https://github.com/wapiflapi/villoc.git',
  ref: '27a22dc5102b95531b2d9a703905d111572019e7'
}

# Rappel commit ref / release and source.
default['sources']['packages']['rappel'] = {
  type: 'git',
  uri: 'https://github.com/yrp604/rappel.git',
  ref: 'a969940408afb4717a77f5e2a13792156b1c2301'
}

# Checksec commit ref / release and source.
default['sources']['packages']['checksec'] = {
  type: 'git',
  uri: 'https://github.com/slimm609/checksec.sh.git',
  ref: '27de40eb0d79a09b4429d4f14ab5a482b932501e'
}

# Checksec commit ref / release and source.
default['sources']['packages']['libc-database'] = {
  type: 'git',
  uri: 'https://github.com/niklasb/libc-database.git',
  ref: '3b8e3cad7da3223814fbc0c5f5804863e52947e7'
}

# pwndbg commit ref / release and source.
default['sources']['packages']['pwndbg'] = {
  type: 'git',
  uri: 'https://github.com/pwndbg/pwndbg.git',
  ref: 'be9b06776b3342d43c358f5fecac6d08470e926f'
}

default['sources']['packages']['gef'] = {
  type: 'git',
  uri: 'https://github.com/hugsy/gef.git',
  ref: 'a0395fe2e8a136025ebd836daf80e797f76f745b'
}

# Recon tools.
default['sources']['packages']['subbrute'] = {
  type: 'git',
  uri: 'https://github.com/TheRook/subbrute.git',
  ref: '6f2e6884a5d779dc3a7e6c89595479886b10a60c'
}

default['sources']['packages']['gobuster'] = {
  type: 'git',
  uri: 'https://github.com/OJ/gobuster.git',
  ref: '7ccd130ad7d5abccc46102fa48ff17c4be9ca185'
}

default['sources']['packages']['seclists'] = {
  type: 'git',
  uri: 'https://github.com/danielmiessler/SecLists.git',
  ref: 'a823fad248aab2912a285dcfea2aae4cdde9ca7f'
}

default['sources']['packages']['sqlmap'] = {
  type: 'git',
  uri: 'https://github.com/sqlmapproject/sqlmap.git',
  ref: '4ac319b074d78243049f9c31778f07410abe5d05'
}
