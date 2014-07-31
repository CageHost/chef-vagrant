#
# Cookbook Name:: cmd_redmine
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

recipes = [
	"lamp",
	"postgresql::server"
]

for r in recipes do
  include_recipe r
end

packages = [
	"ruby1.9.1-dev",
	"ruby-openid",
	"imagemagick",
	"libmagickcore-dev",
	"libmagickwand-dev",
	"libapache2-mod-passenger",
	"libmysqlclient-dev",
	"ruby-passenger"
]

for p in packages do
  package p do
    action [:install]
  end
end

# The rest may automatically install with Bundler
#
# execute "gem install" do
#   command "gem install bundler nokogiri mysql2"
#   action :run
# end