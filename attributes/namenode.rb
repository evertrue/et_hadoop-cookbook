# set['java']['java_home'] = "/usr/lib/jvm/java-7-openjdk-amd64"
# set['java']['java_exec'] = node['java']['java_home'] + "/bin/java"
set['java']['jdk_version'] = '7'

set['hadoop']['core_site']['fs.defaultFS'] = 'hdfs://0.0.0.0/'

set['hadoop']['yarn_site'] = {
  'yarn.resourcemanager.scheduler.address' => '0.0.0.0',
  'yarn.resourcemanager.resource-tracker.address' => '0.0.0.0',
  'yarn.resourcemanager.admin.address' => '0.0.0.0',
  'yarn.resourcemanager.webapp.address' => '0.0.0.0',
  'yarn.resourcemanager.address' => '0.0.0.0'
}
