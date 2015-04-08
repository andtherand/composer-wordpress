root_dir = node['wp_composer']['root_dir']
doc_root = root_dir + "/#{node['wp_composer']['public_folder']}"

log_dir = root_dir + "/#{node['wp_composer']['log_dir']}"

dirs = [
  doc_root + '/' + node['wp_composer']['install_folder'],
  doc_root + '/' + node['wp_composer']['content_folder'],
  log_dir
]

dirs.each do | dir |
   unless File.directory?(dir)
    # installation folder
    directory dir do
        owner 'root'
        group 'root'
        mode '0755'
        recursive true
        action :create
    end
  end
end

[log_dir + '/error.log', log_dir + '/access.log'].each do | log_file |
  unless File.exist?(log_file)
    file log_file do
      action :create
      owner 'root'
      group 'root'
      mode '0644'
    end
  end
end


