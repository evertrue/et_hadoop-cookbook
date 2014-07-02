require 'spec_helper'

describe 'Hadoop Services' do
  %w(
    hadoop-hdfs-namenode
    hadoop-yarn-resourcemanager
  ).each do |svc|
    describe service(svc) do
      it { should be_enabled }
      it { should be_running }
    end
  end

  [
    8020,
    8030,
    8031,
    8032,
    8033,
    50_070
  ].each do |test_port|
    describe port(test_port) do
      it { should be_listening }
    end
  end

  describe command('curl -s http://localhost:50070/dfshealth.jsp') do
    it { should return_stdout(/Hadoop NameNode&nbsp;0.0.0.0:8020/) }
  end

  describe command('curl ' \
    'http://localhost:50070/jmx?qry=Hadoop:service=NameNode,name=NameNodeInfo') do
    it { should return_stdout(/\\"adminState\\":\\"In Service\\"/) }
  end
end

describe 'Hadoop Config' do
end

describe 'HDFS' do
  describe command('/usr/bin/hdfs dfs -stat /tmp') do
    # This (the output of hdfs dfs -stat) is actually a date string.
    # it should only show up if the file (which is created by our recipe)
    # actually exists.
    it { should return_stdout(/20\d{2}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}/) }
  end
end
