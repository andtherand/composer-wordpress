#
# Cookbook Name:: composer-wordpress
# Recipe::_db
#
# Copyright 2015, shape-VS-stroke (svs)

db = node['wp_composer']['db']

mysql2_chef_gem 'default' do
  gem_version '0.3.17'
  action      :install
end

mysql_connection_info = {
  :host     => db['host'],
  :username => db['root'],
  :password => db['server_root_password']
}

# create the database
mysql_database db['name'] do
  connection  mysql_connection_info
  action      :create
end

# create the user and grant rights
mysql_database_user db['user'] do
  connection  mysql_connection_info
  password    db['password']
  privileges  db['privileges']
  action      [:create, :grant]
end


