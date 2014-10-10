require "yaml"
vconfig = YAML::load_file("config.yml")

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "puppetlabs/debian-7.4-64-nocm"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "private_network", ip: vconfig['ip']
  config.vm.network "public_network"
  config.vm.synced_folder vconfig['share_dir'], "/var/www", group: "www-data", mount_options: ["umask=0002", "dmode=2775", "fmode=0664"]

  config.ssh.forward_agent = true
# config.ssh.private_key_path = ['~/.vagrant.d/insecure_private_key']

  config.omnibus.chef_version = :latest

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = ["berks-cookbooks", "site-cookbooks"]
    chef.data_bags_path = "data_bags"
    chef.json = {
      "apt" => {
        "compile_time_update" => true
      },
      "build-essential" => {
        "compile_time" => true
      },
      "apache" => {
        "listen_ports" => [
          "8080"
        ],
        "user" => "www-data",
        "group" => "www-data",
        "default_site_enabled" => true
      },
      "nginx" => {
        "default_site_enabled" => false
      },
      "mysql" => {
        "allow_remote_root" => true,
        "server_root_password" => vconfig["password"],
        "server_debian_password" => vconfig["password"],
        "server_repl_password" => vconfig["password"]
      },
      "php" => {
        "directives" => {
          "upload_max_filesize" => "128M",
          "post_max_size" => "128M"
        }
      },
      "java" => {
        "install_flavor" => "oracle",
          "jdk_version" => "7",
          "oracle" => {
          "accept_oracle_download_terms" => true
        }
      },
      "elasticsearch" => {
        "cluster" => { 
          "name" => "default" 
        }
      },
      "nodejs" => {
        "version" => "0.10.26"
      }
    }
    chef.run_list = vconfig['runlist']
    chef.log_level = vconfig['log_level']
  end

end