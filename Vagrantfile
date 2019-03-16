Vagrant.configure("2") do |config|
	config.vm.box = "hashicorp/precise64"
	
	config.vm.define :web do |web_config|
		web_config.vm.network "forwarded_port", guest: 8080, host: 8081
		web_config.vm.provision "shell", inline: "sudo apt-get update && sudo apt-get install -y puppet"
		
		web_config.vm.provision "puppet" do |puppet|
			puppet.manifest_file = "web.pp"
		end

		web_config.vm.provision :reload
	end

	# Habilita interface gráfica, configura memória, define número de cpus e configura o proxy
	config.vm.provider :virtualbox do |vb|
        vb.gui = true
        vb.memory = 4096
        vb.cpus = 3

		vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    	vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end
end