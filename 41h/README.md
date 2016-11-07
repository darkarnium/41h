# 41h

Provides a Chef environment cookbook for provisioning an 0x4F CTF node.

## Requirements

### Platforms

Per the `.kitchen.yml` in the root of this cookbook, support is as follows:

* Ubuntu 16.04

Due to the assumption of Ubuntu package names, and the use of `apt`, this cookbook is likely not compatible with other distributions without modification.

### Chef

* Chef >= 12.X

### Cookbooks

* apt (~> 5.0.0)
* build-essential (~> 7.0.1)
* poise-python (~> 1.5.1)
* ntp (~> 3.2.0)
* sysctl (~> 0.8.0)

## Attributes

The following attributes should be overridden through this cookbooks, or another mechanism (such as attribute JSON, or Chef server attributes).

* `node['base']['packages']`
  * An array of packages to install via `apt-get`.
* `node['python']['packages']``
  * An array of packages to install via Python pip.
