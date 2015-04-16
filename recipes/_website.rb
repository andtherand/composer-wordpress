#
# Cookbook Name:: composer-wordpress
# Recipe::_website
#
# Copyright 2015, shape-VS-stroke (svs)

wp = node['wp_composer']

web_app wp['project_name'] do
  template        "site.conf.erb"
  docroot         "#{wp['root_dir']}/#{wp['public_folder']}"
  server_name     wp['server_name']
  server_aliases  wp['server_aliases']
  log_dir         "#{wp['root_dir']}/#{wp['log_dir']}"
  application_env wp['application_env']
  log_level       wp['log_level']
end