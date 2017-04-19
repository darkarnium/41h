# Unicorn commit ref / release and source.
default['sources']['packages']['unicorn'] = {
  type: 'git-general',
  uri: 'https://github.com/unicorn-engine/unicorn.git',
  ref: 'a2edc1852d862dcfbf88866a3a26a9f5b2bdf037',
}

# Keystone commit ref / release and source.
default['sources']['packages']['keystone'] = {
  type: 'git-general',
  uri: 'https://github.com/keystone-engine/keystone.git',
  ref: 'ae94ae9e645f81df1cf3d27e323e78c3023cdfe4',
}

# Ropgadget commit ref / release and source.
default['sources']['packages']['ropgadget'] = {
  type: 'git-general',
  uri: 'https://github.com/JonathanSalwan/ROPgadget.git',
  ref: '282d8516f21c85b17cab95165620bb4009cc68a0',
}

# Villoc commit ref / release and source.
default['sources']['packages']['villoc'] = {
  type: 'git-general',
  uri: 'https://github.com/wapiflapi/villoc.git',
  ref: '27a22dc5102b95531b2d9a703905d111572019e7',
}

# Rappel commit ref / release and source.
default['sources']['packages']['rappel'] = {
  type: 'git-general',
  uri: 'https://github.com/yrp604/rappel.git',
  ref: 'a969940408afb4717a77f5e2a13792156b1c2301',
}

# Checksec commit ref / release and source.
default['sources']['packages']['checksec'] = {
  type: 'git-general',
  uri: 'https://github.com/slimm609/checksec.sh.git',
  ref: '27de40eb0d79a09b4429d4f14ab5a482b932501e',
}

# Checksec commit ref / release and source.
default['sources']['packages']['libc-database'] = {
  type: 'git-general',
  uri: 'https://github.com/niklasb/libc-database.git',
  ref: '3b8e3cad7da3223814fbc0c5f5804863e52947e7',
}

# pwndbg commit ref / release and source.
default['sources']['packages']['pwndbg'] = {
  type: 'git-general',
  uri: 'https://github.com/pwndbg/pwndbg.git',
  ref: 'be9b06776b3342d43c358f5fecac6d08470e926f',
}

default['sources']['packages']['gef'] = {
  type: 'git-general',
  uri: 'https://github.com/hugsy/gef.git',
  ref: 'a0395fe2e8a136025ebd836daf80e797f76f745b',
}

# Collaboration tools.
default['sources']['packages']['wemux'] = {
  type: 'git-general',
  uri: 'https://github.com/zolrath/wemux.git',
  ref: '01c6541f8deceff372711241db2a13f21c4b210c',
}

# Recon tools.
default['sources']['packages']['subbrute'] = {
  type: 'git-general',
  uri: 'https://github.com/TheRook/subbrute.git',
  ref: '6f2e6884a5d779dc3a7e6c89595479886b10a60c',
}

default['sources']['packages']['seclists'] = {
  type: 'git-general',
  uri: 'https://github.com/danielmiessler/SecLists.git',
  ref: 'a823fad248aab2912a285dcfea2aae4cdde9ca7f',
}

default['sources']['packages']['sqlmap'] = {
  type: 'git-general',
  uri: 'https://github.com/sqlmapproject/sqlmap.git',
  ref: '4ac319b074d78243049f9c31778f07410abe5d05',
}

# Go is special, because of course it is.
default['sources']['packages']['gobuster'] = {
  type: 'git-go',
  uri: 'https://github.com/OJ/gobuster.git',
  ref: '7a6d1c068e3e89ee9b3c0c01cb3946957143a0c9',
}
