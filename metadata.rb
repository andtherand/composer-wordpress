name             'composer-wordpress'
maintainer       'mychiara'
maintainer_email 'mychiara+cookbooks@gmail.com'
license          'MIT'
description      'Installs/Configures composer-wordpress'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.2'

depends 'composer'
depends 'openssl'
depends 'database'
depends 'mysql2_chef_gem'
depends 'apache2'