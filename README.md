# 41h

![41h](docs/images/franky.png?raw=true)

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

...and more! See the `41h/attributes/sources.rb` and `41h/attributes/base.rb` for a full list.

## Sources

Due to the number of source distributions installed, source packages will not be attempted to be compiled when the machine is launched. This is done to reduce start-up time.

All sources are cloned into `/opt/sources/` and can be installed appropriately from there.

## Scratch

A scratch directory - named `scratch`, who wudda thunk it? - is mounted inside of the VM using Vagrant's 'Synced Folders'. This allows for work on code inside of the parent machine, and provides a quick mechanism for 'bussing' files between the host machine and the VM.

**Beware!** VirtualBox does not play nicely with symlinks.

## Getting Started

First up, ensure the following dependencies are installed and configured:

* Vagrant
  * https://www.vagrantup.com/
  * No configuration required.

* VirtualBox
  * https://www.virtualbox.org/wiki/Downloads
  * Ensure Intel VT or AMD-V is configured on the system.
  * Change the virtual machine default directory (optional).

**Tip!** If running under Windows, a command-line compatible SSH client is required to be in the user's path, or things will fail. 'Git Bash' from https://git-scm.com/downloads works well for this, just make sure that all commands are run inside of 'Git Bash' instead of PowerShell or CMD.

After the above is installed, just open a terminal, change into this directory and issue a `vagrant up`. Assuming all goes well, the VM will be provisioned and can be logged into using `vagrant ssh` from this directory.

## Problems?

Raise a GitHub issue, or fix it and raise a PR :)
