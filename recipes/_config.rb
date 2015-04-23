#
# Cookbook Name:: composer-wordpress
# Recipe::_config
#
# Copyright 2015, shape-VS-stroke (svs)

::Chef::Recipe.send(:include, Opscode::OpenSSL::Password)
node.set_unless['wp_composer']['keys']['auth'] = secure_password
node.set_unless['wp_composer']['keys']['secure_auth'] = secure_password
node.set_unless['wp_composer']['keys']['logged_in'] = secure_password
node.set_unless['wp_composer']['keys']['nonce'] = secure_password
node.set_unless['wp_composer']['salt']['auth'] = secure_password
node.set_unless['wp_composer']['salt']['secure_auth'] = secure_password
node.set_unless['wp_composer']['salt']['logged_in'] = secure_password
node.set_unless['wp_composer']['salt']['nonce'] = secure_password
node.save unless Chef::Config[:solo]

wp = node['wp_composer']

# just to shorten the template names in the template resources
public_folder = "#{wp['root_dir']}/#{wp['public_folder']}"

template "#{public_folder}/index.php" do
  source  'index.php.erb'
  owner   'root'
  group   'root'
  mode    '0644'
  variables({
      'install_folder' => wp['install_folder']
  })
end

template "wp['root_dir']}/main-config.php" do
  source 'main-config.php.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables({
    'language'  => wp['language'],
    'db'        => wp['db'],
    'keys'      => wp['keys'],
    'salt'      => wp['salt'],
    'home'      => wp['server_name']
  })
end

template "#{public_folder}/wp-config.php" do
  source  'wp-config.php.erb'
  owner   'root'
  group   'root'
  mode    '0644'
end

template "#{public_folder}/.htaccess" do
    source  '.htaccess.erb'
    owner   'root'
    group   'root'
    mode    '0644'
end


