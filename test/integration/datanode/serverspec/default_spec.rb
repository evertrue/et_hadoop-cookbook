require 'spec_helper'

describe 'Hadoop Environment' do
  %w(
    hdfs
    mapred
  ).each do |cur_user|
    describe user(cur_user) do
      it { should exist }
    end

    describe group(cur_user) do
      it { should exist }
    end
  end
end

describe 'Hadoop Services' do
  %w(
    hadoop-hdfs-datanode
    hadoop-yarn-nodemanager
  ).each do |svc|
    describe service(svc) do
      it { should be_enabled }
      it { should be_running }
    end
  end

  [
    50_010,
    50_020,
    50_075
  ].each do |test_port|
    describe port(test_port) do
      it { should be_listening }
    end
  end

  context command('curl -s http://localhost:50075/dataNodeHome.jsp') do
    it { should return_stdout(/(active)/) }
  end
end

describe 'Hadoop Config' do
  describe file('/etc/hadoop/conf.chef/core-site.xml') do
    it do
      should contain('file:///mnt/dev0/tmp/hadoop-${user}')
    end
    it { should contain('hdfs://namenode-ubuntu-1204.vagrantup.com/</value>') }
  end

  describe file('/etc/hadoop/conf.chef/hdfs-site.xml') do
    it { should contain('file:///mnt/dev0/data/hadoop-hdfs/data,' \
      'file:///mnt/dev1/data/hadoop-hdfs/data') }
  end

  describe file('/etc/hadoop/conf.chef/yarn-site.xml') do
    it { should contain('namenode-ubuntu-1204.vagrantup.com') }
  end
end
