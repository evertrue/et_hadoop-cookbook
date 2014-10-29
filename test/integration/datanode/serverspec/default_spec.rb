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
    hadoop-0.20-mapreduce-tasktracker
  ).each do |svc|
    describe service(svc) do
      it { should be_enabled }
      it { should be_running }
    end
  end

  [
    50_010,
    50_020,
    50_060,
    50_075
  ].each do |test_port|
    describe port(test_port) do
      it { should be_listening }
    end
  end

  describe command('curl http://localhost:50060/tasktracker.jsp') do
    its(:stdout) { should match(/Task Tracker Status/) }
  end
end

describe 'Hadoop Config' do
  describe file('/etc/hadoop/conf.live/core-site.xml') do
    its(:content) do
      should include('/mnt/dev0/tmp/hadoop-${user.name},' \
        '/mnt/dev1/tmp/hadoop-${user.name}</value>')
    end
    its(:content) { should include('hdfs://namenode-ubuntu-1204.vagrantup.com/</value>') }
  end

  describe file('/etc/hadoop/conf.live/hdfs-site.xml') do
    its(:content) { should include('/mnt/dev0/data/dfs/dn') }
    its(:content) { should include('/mnt/dev1/data/dfs/dn') }
  end

  describe file('/etc/hadoop/conf.live/mapred-site.xml') do
    its(:content) do
      should include('/mnt/dev0/data/mapred/local,' \
        '/mnt/dev1/data/mapred/local')
    end
    its(:content) { should include('namenode-ubuntu-1204.vagrantup.com:8021') }
  end
end
