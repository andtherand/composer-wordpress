name             'composer-wordpress'
maintainer       'mychiara'
maintainer_email 'mychiara+cookbooks@gmail.com'
license          'MIT'
description      'Installs/Configures composer-wordpress'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'

dependencies = ['composer', 'openssl', 'database', 'mysql_chef_gem']

dependencies.each do | dependency |
    depends dependency
end
