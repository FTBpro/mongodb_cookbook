#
# Cookbook Name:: mongodb
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

apt_repository 'mongodb' do
  uri "http://downloads-distro.mongodb.org/repo/ubuntu-upstart"
  distribution 'dist'
  components ['10gen']
  keyserver 'hkp://keyserver.ubuntu.com:80'
  key '7F0CEB10'
  action :add
end

package "mongodb-org"

chef_gem "mongo"

mongodb_admin_user node.mongodb["admin"]["username"] do
  password node.mongodb["admin"]["password"]
  roles node.mongodb["admin"]["roles"]
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
