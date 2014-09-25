set['hadoop']['local_fqdn'] = node.name + '.priv.evertrue.com'
set['hadoop']['env_default']['hadoop']['HADOOP_OPTS'] =
  '-Djdk.xml.entityExpansionLimit=0'
set['hadoop']['env_default']['hadoop']['HADOOP_OPTS'] =
  '-Djdk.xml.entityExpansionLimit=0'
set['pam_d']['services']['su']['main'] = {
  'pam_limits' => {
    'interface' => 'session',
    'control_flag' => 'optional',
    'name' => 'pam_limits.so'
  }
}

set['hadoop']['mapred-site']['mapred.tasktracker.map.tasks.maximum'] =
  node['cpu']['total']
set['hadoop']['mapred-site']['mapred.tasktracker.reduce.tasks.maximum'] =
  node['cpu']['total']
set['hadoop']['mapred-site']['mapred.child.java.opts'] =
  -Xmx1024M
