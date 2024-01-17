Vagrant.configure("2") do |config|
  config.vm.box = "generic/ubuntu2204"
  config.vm.hostname = "ubuntu2204"
  
    config.vm.provider "hyperv" do |v|
      v.maxmemory =  4096
      v.memory = 4096
      v.cpus = 4
    end
  
    config.vm.provision "file", source: "user_info", destination: "user_info"
    config.vm.provision "shell", path: "provision.sh"
end