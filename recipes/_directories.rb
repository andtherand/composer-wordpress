#
# Cookbook Name:: composer-wordpress
# Recipe::_directories
#
# Copyright 2015, shape-VS-stroke (svs)

root_dir  = node['wp_composer']['root_dir']
doc_root  = "#{root_dir}/#{node['wp_composer']['public_folder']}"
log_dir   = "#{root_dir}/#{node['wp_composer']['log_dir']}"
content_folder = "#{doc_root}/#{node['wp_composer']['content_folder']}"
uploads_folder = "#{content_folder}/uploads"

dirs = [
  "#{doc_root}/#{node['wp_composer']['install_folder']}",
  content_folder,
  log_dir
]

dirs.each do | dir |
  # installation folder
  directory dir do
    owner     'root'
    group     'root'
    mode      '0755'
    recursive true
    action    :create

    not_if { ::File.directory?(dir) }
  end
end

directory uploads_folder  do
  owner   node['apache']['user']
  group   node['apache']['group']
  mode    '0755'
  action  :create

  not_if { ::File.directory?(uploads_folder) }
end

["#{log_dir}/error.log", "#{log_dir}/access.log"].each do | log_file |
  file log_file do
    owner   'root'
    group   'root'
    mode    '0644'
    action  :create

    not_if { ::File.exist?(log_file) }
  end
end


# init .gitignore

template "#{root_dir}/.gitignore" do
  source  '.gitignore.erb'
  owner   'root'
  group   'root'
  mode    '0644'
end
