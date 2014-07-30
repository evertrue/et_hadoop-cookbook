#
# Cookbook Name:: et_hadoop
# Recipe:: default
#
# Copyright (C) 2013 EverTrue, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'pam'
include_recipe 'storage'

if node['storage'] && node['storage']['ephemeral_mounts']
  node.override['hadoop']['data_root'] =
    node['storage']['ephemeral_mounts'].map { |em| "file:///#{em}/data" }
  node.override['hadoop']['tmp_root'] =
    node['storage']['ephemeral_mounts'].map { |em| "#{em}/tmp" }
end
