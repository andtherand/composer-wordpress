wp = node['wp_composer']

root_dir = node['wp_composer']['root_dir']

web_app wp['project_name'] do
  template "site.conf.erb"
  docroot root_dir + "/#{node['wp_composer']['public_folder']}"
  server_name wp['server_name']
  server_aliases wp['server_aliases']
  log_dir root_dir + "/#{node['wp_composer']['log_dir']}"
  application_env wp['application_env']
  log_level wp['log_level']
end