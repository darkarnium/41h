# 41h

![41h](docs/images/franky.png?raw=true)

A set of scripts to configure and deploy a 0x4F CTF bootstrap. Everything needed to get started on CTF challenges, kitchen sink and all.

## Included

* angr
* Capstone.
* Unicorn.
* Radare2.
* Keystone.
* Checksec.
* Z3.
* Binwalk.
* Pwndbg (gdb).
* Qemu.
* Hydra.
* Pwntools.
* The usual \*nix goodies.
  * `socat`, `vim`, `nc`, `strace`, etc.

...and more! See the `41h/attributes/sources.rb`, `41h/attributes/base.rb`, `41h/attributes/ruby.rb`... well, everything in `41h/attributes/` really... for a full list.

### Jupyter

Jupyter is included and runs on start, but will only bind to localhost (`127.0.0.1:8888`), and the Notebook password is set to `41h` via Chef `node['python']['jupyter']['password']` attribute. As a result, an SSH tunnel should be used to access Jupyter.

## Sources

Due to the number of source distributions installed, source packages will not be attempted to be compiled when the machine is launched. This is done to reduce start-up time.

All sources are cloned into `/opt/sources/` and can be installed appropriately from there.

## Scratch

A scratch directory - named `scratch`, who'da thunk it? - is mounted inside of the VM using Vagrant's 'Synced Folders'. This allows for work on code inside of the parent machine, and provides a quick mechanism for 'bussing' files between the host machine and the VM.

**Beware!** VirtualBox does not play nicely with symlinks.

## Getting Started

### SSH Keys

To begin, make sure that your SSH public key and username has been added to the `default['system']['users']` array inside of `41h/attributes/users.rb`. If this is not done, you will not be able to login to the machine once provisioning is complete (as the deployed `sshd` configuration disables password authentication by default).

Keys should be added to the existing array in the following format:

```
  {
    'username' => '<MY_USER>',
    'ssh_key' => 'ssh-xxxx <MY_SSH_PUBKEY> Chef_Installed',
  },
```

### This Machine

If for some reason you want to install 41h on the machine that you have checked the repository out onto, perform the following:

1) Run `deploy-local.sh` from this directory.
2) Wait.

### Digital Ocean

*NOTE:* Digital Ocean will charge a MINIMUM of 1 hour if a machine is spawned and then torn down immediately. If using a '48GB' instance (default), this will run you around CAD$0.71 every time the instance is built. If running a lot of tests, please use the Vagrant deployment script, or use a smaller instance to reduce cost!

To deploy a new 41h machine into Digital Ocean (via the API), perform the following:

1) Run `pip install -r requirements.txt` from this directory.
2) Run `python2.7 deploy-digitalocean.py --api-token <DO_API_TOKEN>` from this directory.
3) Wait.

### Vagrant

To deploy a local virtual machine via Vagrant, perform the following:

1) First up, ensure the following dependencies are installed and configured:
  * Vagrant
    * https://www.vagrantup.com/
    * No configuration required (if using the VirtualBox driver).
  * VirtualBox
    * https://www.virtualbox.org/wiki/Downloads
    * Ensure Intel VT or AMD-V is configured on the system.
    * Change the virtual machine default directory (optional).
2) Run `vagrant up` from this directory.
3) Wait.
4) Login using `vagrant ssh`.
5) When done, run `vagrant destroy` to tear-down the machine once again.

**Tip!** If running under Windows, a command-line compatible SSH client is required to be in the user's path, or things will fail. 'Git Bash' from https://git-scm.com/downloads works well for this, just make sure that all commands are run inside of 'Git Bash' instead of PowerShell or CMD.

## Problems?

Raise a GitHub issue, or fix it and raise a PR :)
