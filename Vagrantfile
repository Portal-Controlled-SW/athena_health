# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end

  # Provision once as root
  config.vm.provision :shell, path: "script/install_deps.sh", privileged: true

  # Provision once as vagrant
  config.vm.provision :shell, path: "script/setup_ruby.sh", args: "2.2.3", privileged: false
end
