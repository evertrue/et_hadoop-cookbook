#
# Cookbook Name:: et_hadoop
# Recipe:: default
#
# Copyright (C) 2013 EverTrue, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt' if node.platform_family == 'debian'
include_recipe 'java::default'
include_recipe 'storage'

if node['storage'] && node['storage']['ephemeral_mounts']
  node.set['hadoop']['tmp_dir'] = "#{node['storage']['ephemeral_mounts'].first}/tmp"
  node.set['hadoop']['core_site']['hadoop.tmp.dir'] =
    "file://#{node['hadoop']['tmp_dir']}/hadoop-${user}"
  node.set['hadoop']['hdfs_site']['dfs.name.dir'] =
    node['storage']['ephemeral_mounts'].map { |em| "file://#{em}/data/hadoop-hdfs/name" }.join(',')
  node.set['hadoop']['hdfs_site']['dfs.data.dir'] =
    node['storage']['ephemeral_mounts'].map { |em| "file://#{em}/data/hadoop-hdfs/data" }.join(',')
end

unless node.recipes.include? 'et_hadoop::namenode'
  if Chef::Config[:solo]
    fail 'Chef Solo not supported.  This recipe requires search.'
  else
    namenode = search(
      :node,
      "chef_environment:#{node.chef_environment} AND " \
      'recipes:et_hadoop\:\:namenode AND ' \
      "hadoop_cluster_name:#{node['hadoop']['cluster_name']}"
    ).first
  end
  node.set['hadoop']['core_site']['fs.defaultFS'] = "hdfs://#{namenode['fqdn']}/"
end

# Old cookbook:
#
# if node['storage'] && node['storage']['ephemeral_mounts']
#   node.override['hadoop']['data_root'] =
#     node['storage']['ephemeral_mounts'].map { |em| "#{em}/data" }
#   node.override['hadoop']['tmp_root'] =
#     node['storage']['ephemeral_mounts'].map { |em| "#{em}/tmp" }
# end
