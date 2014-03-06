# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.require_plugin "vagrant-chef-zero"

Vagrant.configure("2") do |config|
  config.vm.hostname = "et-hadoop-berkshelf"

  case ENV["VAGRANT_DEFAULT_PROVIDER"]
  when "aws"

    config.vm.box = "dummy"
    config.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"

    config.vm.provider :aws do |aws, override|
      aws.access_key_id = "#{ENV['AWS_ACCESS_KEY']}"
      aws.secret_access_key = "#{ENV['AWS_SECRET_KEY']}"
      aws.keypair_name = "aws_dev"
      #aws.private_ip_address = "10.0.0.165"

      # Ubuntu 12.04
      aws.ami = "ami-cf5e2ba6"
      # Amazon Linux
      #aws.ami = "ami-d31c70ba"

      aws.security_groups = ["sg-79ea5a16"]
      aws.subnet_id = "subnet-d97dcfb2"
      aws.tags = {
        "Name" => "stage-et-base-#{config.vm.hostname}",
        "Role" => "et_base Testing",
        "Env" => "stage"
      }
      aws.elastic_ip = true

      override.ssh.username = "ubuntu"
      override.ssh.private_key_path = "#{ENV['HOME']}/.ssh/aws_dev.pem"
      #override.ssh.host = "10.0.0.165"
    end

    config.vm.provision :shell, :inline => "mkdir -p /etc/chef/ohai/hints && echo '{}' > /etc/chef/ohai/hints/ec2.json"

  else

    config.vm.provider "virtualbox" do |v|
      v.customize ['modifyvm', :id, "--memory", "1024"]

      # We want to replicate the environment on ec2 where initial provisions
      # have to work WITHOUT being able to resolve our own name on the local
      # DNS server
      v.customize ['setextradata', :id, "VBoxInternal/Devices/{pcnet,e1000}/0/LUN#0/Config/HostResolverMappings/ et-java-berkshelf/HostIP", ""]
    end

    config.vm.box = "precise64"
    config.vm.box_url = "http://cloud-images.ubuntu.com/precise/current/precise-server-cloudimg-vagrant-amd64-disk1.box"

  end

  #config.vm.box_url = "http://cloud-images.ubuntu.com/precise/current/precise-server-cloudimg-vagrant-amd64-disk1.box"
  #config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.network :private_network, ip: "33.33.33.10"
  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest

  config.vm.synced_folder "#{ENV['HOME']}/.chef", "/tmp/local-chef"

  if ENV['CHEF_REPO']
    chef_repo = ENV['CHEF_REPO']
  else
    raise "CHEF_REPO is not defined"
  end

  config.chef_zero.chef_repo_path = ".chef-zero/"

  config.vm.provision :chef_solo do |chef|
    chef.encrypted_data_bag_secret = "/tmp/local-chef/encrypted_data_bag_secret"
    #chef.environment = "stage"
    chef.log_level = :info
    chef.data_bags_path = "#{chef_repo}/data_bags"
    chef.node_name = "et-hadoop-berkshelf"
    chef.roles_path = "#{chef_repo}/roles"
    chef.json = {
      'hadoop' => {
        'hosts' => {
          'namenode_default' => 'default_namenode.priv',
          'jobtracker_default' => 'default_jobtracker.priv'
        }
      }
    }

    #chef.run_list = []
    # chef.run_list = [
    #     "recipe[et_hadoop::datanode]"
    # ]
    chef.run_list = [
      "recipe[et_hadoop::namenode]",
      "recipe[et_hadoop::jobtracker]",
      "role[namenode]",
      "role[jobtracker]"
    ]
  end
end
