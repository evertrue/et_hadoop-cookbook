set['hadoop']['distribution'] = 'cdh'
set['hadoop']['envfile']['HADOOP_OPTS'] = '-Djdk.xml.entityExpansionLimit=0'

# Old cookbook:
set['hadoop']['local_fqdn'] = node.name + '.priv.evertrue.com'
set['hadoop']['env_default']['hadoop']['HADOOP_OPTS'] =
  '-Djdk.xml.entityExpansionLimit=0'
