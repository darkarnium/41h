#
# Cookbook Name:: 41h
# Recipe:: default
#

include_recipe '41h::base'
include_recipe '41h::firewall'
include_recipe '41h::users'
include_recipe '41h::sources'
include_recipe '41h::python'
include_recipe '41h::assembly'
include_recipe '41h::emulate'
include_recipe '41h::debug'
include_recipe '41h::ruby'
include_recipe '41h::recon'
include_recipe '41h::crypto'
