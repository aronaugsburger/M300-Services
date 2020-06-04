#!/bin/bash
#
#	LB2 Aron Augsburger
#   - Erstellt mehrere VM's mit jeweils anderer Startseite (index.html).

for vm in web01 web02
do

    mkdir ${vm}
    cd ${vm}
    
    # Vagrantfile 
    cat <<%EOF% >Vagrantfile
        Vagrant.configure(2) do |config|
          config.vm.box = "kmm/ubuntu-xenial64"
          config.vm.network "forwarded_port", guest:80, host:8080, auto_correct: true
          config.vm.synced_folder ".", "/var/www/html"  
        config.vm.provider "hyperv" do |h|
          h.memory = "256"  
        end
        config.vm.provision "shell", inline: <<-SHELL 
          sudo apt-get update
          sudo apt-get -y install apache2
        SHELL
        end
%EOF%

    # index.html 
    cat <<%EOF% >index.html
    <html>
        <body>
            <h1>Hallo ${vm}</h1>
        </body>
    <html>
%EOF%
    vagrant up
    cd ..


for vm in db01 db02
do

    mkdir ${vm}
    cd ${vm}
    
    # Vagrantfile 
    cat <<%EOF% >Vagrantfile
        Vagrant.configure(2) do |config|
          config.vm.box = "kmm/ubuntu-xenial64"
          config.vm.network "forwarded_port", guest:3306, host:3306, auto_correct: true
          config.vm.synced_folder ".", "/var/lib/mysql"  
        config.vm.provider "hyperv" do |h|
          h.memory = "256"  
        end
        config.vm.provision "shell", inline: <<-SHELL 
          sudo apt-get update
          sudo apt-get -y install mysql-server
        SHELL
        end
%EOF%
    vagrant up
    cd ..
    
done