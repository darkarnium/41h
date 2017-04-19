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

* ntp (~> 3.2.0)
* apt (~> 5.0.0)
* sysctl (~> 0.8.0)
* poise-python (~> 1.5.1)
* build-essential (~> 7.0.1)
