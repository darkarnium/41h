# 41h

A set of scripts to configure and deploy a 0x4F CTF bootstrap. Everything needed to get started on CTF challenges, kitchen sink and all.

## Included

* Capstone.
* Unicorn.
* Radare2.
* Keystone.
* Checksec.
* Z3.
* Binwalk.
* The usual \*nix goodies.
 * `socat`, `vim`, `nc`, `strace`, etc.


## Scratch

A scratch directory - named `scratch`, who wudda thunk it? - is mounted inside of the VM using Vagrant's 'Synced Folders'. This allows for work on code inside of the parent machine, and provides a quick mechanism for 'bussing' files between the host machine and the VM.

**Beware!** VirtualBox does not play nicely with symlinks.
