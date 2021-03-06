#
# Cookbook Name:: mongodb
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt::default'

apt_repository 'mongodb' do
  uri "http://downloads-distro.mongodb.org/repo/ubuntu-upstart"
  distribution 'dist'
  components ['10gen']
  keyserver 'hkp://keyserver.ubuntu.com:80'
  key '7F0CEB10'
  action :add
end

package 'mongodb-org' do
  action :install
end

%w{make build-essential}.each do |p|
  package p do
    action :nothing
  end.run_action(:install)
end

chef_gem "mongo" do
  version '1.12.0'
end

if node.mongodb['admin']['create']
  mongodb_admin_user node.mongodb["admin"]["username"] do
    password node.mongodb["admin"]["password"]
    roles node.mongodb["admin"]["roles"]
    retries 10
    retry_delay 20
  end
end

service "mongod"

template "/etc/mongod.conf" do
  source "mongod.conf.erb"
  user "mongodb"
  variables({
    auth: node.mongodb["config"]["auth"],
    bind_ip: node.mongodb["config"]["bind_ip"]
  })
  notifies :restart, "service[mongod]"
end
