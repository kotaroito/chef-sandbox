#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "apache2" do
  action :install
end

template "ports.conf" do
  path "/etc/apache2/ports.conf"
  owner "root"
  group "root"
  mode 0644
  notifies :reload, 'service[apache2]'
end

service "apache2" do
  action [:enable, :start]
end
