node.set['hadoop']['yarn_site']['yarn.resourcemanager.hostname'] =
  search(:node, 'recipes:continuuity_hadoop\:\:hadoop_yarn_resourcemanager AND ' \
    "hadoop_cluster_name:#{node['hadoop']['cluster_name']} AND " \
    "chef_environment:#{node.chef_environment}").first['fqdn']

fail 'Chef Solo not supported.  This recipe requires search.' if Chef::Config[:solo]

namenode = search(
  :node,
  "chef_environment:#{node.chef_environment} AND " \
  'recipes:et_hadoop\:\:namenode AND ' \
  "hadoop_cluster_name:#{node['hadoop']['cluster_name']}"
).first

fail 'Could not locate the namenode' if namenode.empty?

node.set['hadoop']['core_site']['fs.defaultFS'] = "hdfs://#{namenode['fqdn']}/"

include_recipe 'et_hadoop::default'
include_recipe 'continuuity_hadoop::hadoop_hdfs_datanode'
include_recipe 'et_hadoop::overrides'

resources(service: 'hadoop-hdfs-datanode').action([:enable,:start])
