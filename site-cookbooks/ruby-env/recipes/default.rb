#
# Cookbook Name:: ruby-env
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{git libssl-dev}.each do |pkg|
  package pkg do
    action :install
  end
end

git "/home/#{node['ruby-env']['user']}/.rbenv" do
  repository node['ruby-env']['rbenv_url']
  action :sync
  user node['ruby-env']['user']
  group node['ruby-env']['group']
end
