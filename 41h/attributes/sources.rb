# Unicorn commit ref / release and source.
default['sources']['packages']['unicorn'] = {
  type: 'git-general',
  uri: 'https://github.com/unicorn-engine/unicorn.git',
  ref: 'a2edc1852d862dcfbf88866a3a26a9f5b2bdf037',
}

# Radare2 commit ref / release and source.
default['sources']['packages']['radare2'] = {
  type: 'git-general',
  uri: 'https://github.com/radare/radare2.git',
  ref: '95f842729cd2f9f7ca85445473451a3afdbaff65',
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
  ref: '43698fe354cd657c057b83b29b50b72e04081596',
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

# Crypt and Cracking tools.
default['sources']['packages']['john'] = {
  type: 'git-general',
  uri: 'https://github.com/magnumripper/JohnTheRipper.git',
  ref: '8322a9b3b3ac5a626966a732dc819438ab656d78',
}

default['sources']['packages']['z3'] = {
  type: 'git-general',
  uri: 'https://github.com/Z3Prover/z3.git',
  ref: '82c26509ae0ac1898c6ceb5b9edddae4c1029eb6',
}

# Go is special, because of course it is.
default['sources']['packages']['gobuster'] = {
  type: 'git-go',
  uri: 'https://github.com/OJ/gobuster.git',
  ref: '7a6d1c068e3e89ee9b3c0c01cb3946957143a0c9',
}

# HTTP direct.
default['sources']['packages']['cfr_0_122.jar'] = {
  type: 'http',
  uri: 'http://www.benf.org/other/cfr/cfr_0_122.jar',
  checksum: '65c2dfb76c4904014092663b74c2ea4a8e2f18ca75e98a1e4e064352c618360f',
}
