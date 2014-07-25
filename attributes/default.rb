set['hadoop']['local_fqdn'] = node.name + '.priv.evertrue.com'
set['hadoop']['env_default']['hadoop']['HADOOP_OPTS'] =
  '-Djdk.xml.entityExpansionLimit=0'
set['pam_d']['services']['su']['main'] = {
  'pam_limits' => {
    'interface' => 'session',
    'control_flag' => 'optional',
    'name' => 'pam_limits.so'
  }
}
