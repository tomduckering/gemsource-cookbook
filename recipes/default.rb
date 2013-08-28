#
# Cookbook Name:: gemsource
# Recipe:: default
#
# Copyright (C) 2013 Tom Duckering
# 
# All rights reserved - Do Not Redistribute
#

directory node['gemsource']['root']

cookbook_file "#{Chef::Config[:file_cache_path]}/builder-3.2.2.gem" do
	source 'builder-3.2.2.gem'
end

gem_package 'builder' do
 	source "#{Chef::Config[:file_cache_path]}/builder-3.2.2.gem"
end

execute 'setup gem index' do
	command "gem generate_index -d #{node['gemsource']['root']}"
end