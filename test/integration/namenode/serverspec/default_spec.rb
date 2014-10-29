require 'spec_helper'

describe 'Hadoop Services' do
  %w(
    hadoop-hdfs-namenode
    hadoop-0.20-mapreduce-jobtracker
  ).each do |svc|
    describe service(svc) do
      it { should be_enabled }
      it { should be_running }
    end
  end

  [
    8020,
    8021,
    50_030,
    50_070
  ].each do |test_port|
    describe port(test_port) do
      it { should be_listening }
    end
  end

  describe command('curl http://localhost:50070/dfshealth.jsp') do
    its(:stdout) { should match(/Hadoop NameNode&nbsp;0.0.0.0:8020/) }
  end

  describe command('curl http://localhost:50070/dfsnodelist.jsp?whatNodes=LIVE') do
    its(:stdout) { should match(/In Service/) }
  end
end

describe 'Hadoop Config' do
end

describe 'HDFS' do
  describe command('/usr/bin/hdfs dfs ' \
    '-stat /var/lib/hadoop-hdfs/cache/mapred/mapred/staging') do
    # This (the output of hdfs dfs -stat) is actually a date string.
    # it should only show up if the file (which is created by our recipe)
    # actually exists.
    its(:stdout) { should match(/20\d{2}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}/) }
  end
end
