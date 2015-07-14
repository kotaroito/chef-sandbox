#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

include_recipe "build-essential"

package "nginx" do
  action :install
end

# default conf
template "sites-available/default" do
  path '/etc/nginx/sites-available/default'
  source 'sites-available/default.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :reload, 'service[nginx]'
end

link '/etc/nginx/sites-enabled/default' do
 to '/etc/nginx/sites-available/default'
end

service "nginx" do
  action [ :enable, :start ]
  supports status: true, restart: true, reload: true
end
