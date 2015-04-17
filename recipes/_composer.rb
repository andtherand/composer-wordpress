#
# Cookbook Name:: composer-wordpress
# Recipe::_composer
#
# Copyright 2015, shape-VS-stroke (svs)

public_folder = node['wp_composer']['public_folder']

user_plugins = node['wp_composer'].has_key?('user_plugins') || {}

template "#{node['wp_composer']['root_dir']}/composer.json" do
  source 'composer.json.erb'
  action :create
  variables({
    :wordpress_install_dir    => "#{public_folder}/#{node['wp_composer']['install_folder']}",
    :wordpress_content_path   => "#{public_folder}/#{node['wp_composer']['content_folder']}",
    :version                  => node['wp_composer']['version'],
    :packages                 => node['wp_composer']['default_plugins'].merge(user_plugins),
    :language                 => node['wp_composer']['language']
  })

  #notifies :install, "composer_project[#{node['wp_composer']['root_dir']}]"
end

composer_project node['wp_composer']['root_dir'] do
  dev     true
  quiet   true
  action  :install
end