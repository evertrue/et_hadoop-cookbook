if node['storage'] && node['storage']['ephemeral_mounts']
  d = resources("directory[#{node['hadoop']['tmp_dir']}/hadoop-${user}]")
  d.action(:nothing)

  %w(hdfs mapreduce yarn).each do |dir|
    directory "#{node['hadoop']['tmp_dir']}/hadoop-#{dir}" do
      my_user = (dir == 'mapreduce' ? 'mapred' : dir)
      owner my_user
      group my_user
      mode 01755
      action :create
      recursive true
    end
  end
end
