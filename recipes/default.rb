#
# Cookbook Name:: composer-wordpress
# Recipe:: default
#
# Copyright 2015, shape-VS-stroke (svs)
#

node.default['wp_composer']['root_dir'] = "#{node['wp_composer']['base_path']}/#{node['wp_composer']['project_name']}"

include_recipe 'composer-wordpress::_db'
include_recipe 'composer-wordpress::_directories'
include_recipe 'composer-wordpress::_website'
include_recipe 'composer-wordpress::_composer'