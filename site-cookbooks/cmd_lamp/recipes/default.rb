#
# Cookbook Name:: cmd_lamp
# Recipe:: default
#
# Copyright (C) 2014 Alex Crawford
#
# All rights reserved - Do Not Redistribute
#

recipes = [
	"apt",
	"build-essential",
	"git",
	"php",
	"apache2",
	"apache2::mod_php5",
	"apache2::mod_rewrite",
	"mysql::server",
	"composer",
	"nodejs",
	"rvm::system_install"
]

for r in recipes do
  include_recipe r
end

# Install packages and software

packages = [
	"nano",
	"unzip",
	"aptitude",
	"imagemagick",
	"php5-common",
	"php5-cgi",
	"php5-curl",
	"php5-mcrypt",
	"php5-mysql",
	"php5-gd",
	"php5-imagick",
	"php-apc",
	"sendmail-bin",
	"sendmail"
]

for p in packages do
  package p do
    action [:install]
  end
end

execute "npm install" do
  command "npm install -g grunt-cli"
  not_if "npm list -g grunt-cli"
end

# Add templates, fix permissions and add key

template "/usr/local/bin/devadd" do
  source "devadd.erb"
  owner "root"
  group "staff"
  mode "0755"
end

template "/usr/local/bin/chweb" do
  source "chweb.erb"
  owner "root"
  group "staff"
  mode "0755"
end

directory "/etc/php5/apache2" do
  owner "root"
  group "root"
  mode "0755"
  action :create
end

template "/etc/php5/apache2/php.ini" do
  source "php.ini.erb"
  owner "root"
  group "root"
  mode "0644"
end

directory "/var/www" do
  owner "root"
  group "www-data"
  mode "2775"
  action :create
end

%w[ "/var/www/**/*" ].each do |path|
  file path do
    owner "root"
    group "www-data"
    mode "2775"
  end if File.file?(path)
  directory path do
    owner "root"
    group "www-data"
    mode "0664"
  end if File.directory?(path)
end