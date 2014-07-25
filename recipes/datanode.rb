node.set['hadoop']['yarn_site']['yarn.resourcemanager.hostname'] =
  search(:node, 'recipes:hadoop\:\:hadoop_yarn_resourcemanager AND ' \
    "hadoop_cluster_name:#{node['hadoop']['cluster_name']} AND " \
    "chef_environment:#{node.chef_environment}").first['fqdn']

include_recipe 'et_hadoop::default'
include_recipe 'continuuity_hadoop::hadoop_hdfs_datanode'
include_recipe 'et_hadoop::overrides'
