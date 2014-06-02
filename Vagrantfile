# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true


  config.vm.define :head do |controller|
    controller.vm.hostname = "cluster-head"
    controller.vm.box = "centos-6.3"

    controller.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024"]
    end
    controller.vm.network :private_network, ip: "192.168.33.10"
    controller.vm.synced_folder "./share", "/share"
    controller.vm.provision :shell, :path => "provision.sh"
    controller.vm.provision :shell, :path => "provision-head.sh"
  end

  config.vm.define :engine do |engine|
    engine.vm.hostname = "cluster-engine"
    engine.vm.box = "centos-6.3"

    engine.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024"]
    end
    engine.vm.network :private_network, ip: "192.168.33.11"
    engine.vm.synced_folder "./share", "/share"
    engine.vm.provision :shell, :path => "provision.sh"
    engine.vm.provision :shell, :path => "provision-engine.sh"
  end

end
