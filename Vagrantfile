# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Install Go via Chef:
  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "golang"
  end

  # Now run manual shell script for additional provisioning:
  config.vm.provision "shell", path: "./provision.sh"

  # Define AWS vm
  config.vm.define :ami, autostart: false do |ami|
    ami.omnibus.chef_version = :latest

    ami.vm.provider :aws do |aws, override|
      # This VM specific settings
      aws.tags = {'Name' => 'ami', 'Environments' => 'development'}
      aws.instance_type = "t1.micro"
      aws.ami = "ami-bddaa2bc" # Ubuntu 14.04 64bit
      aws.security_groups = ["launch-wizard-1"]

      # AWS provider common settings
      aws.access_key_id = ENV['AWS_ACCESS_KEY_ID']
      aws.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
      aws.region = "ap-northeast-1" # "Tokyo"
      aws.availability_zone = "ap-northeast-1a"
      aws.keypair_name = "awstom"
      override.ssh.username = "ubuntu"
      override.ssh.private_key_path = "~/.ec2/awstom.pem"
    end

    # Box settings
    # Remarks: This is a dummy box for AWS plug-in.
    ami.vm.box = "dummy"
    ami.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"
  end

  # Define VirtualBox vm
  config.vm.define :vb, primary: true do |vb|
    # Every Vagrant virtual environment requires a box to build off of.
    vb.vm.box = "hashicorp/precise64"
    vb.vm.network "forwarded_port", guest: 5000, host: 5000
    vb.vm.network "private_network", ip: "192.168.33.100"

    # Share the home directory for access to host source code
    # and use NFS for 10-100x speedup:
    vb.vm.synced_folder "~/", "/host", nfs: true

    # Copy the user's .gitconfig (if it exists) so they don't
    # have to reconfigure Git in the VM:
    vb.vm.provision "file", source: "~/.gitconfig", destination: "/home/vagrant/.gitconfig"
  end
end
