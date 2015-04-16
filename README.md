Composer Wordpress Cookbook
===========================
This cookbook installs and configures wordpress via composer.
It utilises the [wordpress composer package by John P. Bloch](https://packagist.org/packages/johnpbloch/wordpress) and is
inspired by an article from [Smashing Magazine](http://www.smashingmagazine.com/2014/03/07/better-dependency-management-team-based-wordpress-projects-composer).
The cookbook also uses the [Koodimooni dropin installer](https://github.com/Koodimonni/Composer-Dropin-Installer) to easily install your favorite languages.
All wordpress plugins/themes can be installed via the great [wpackagist plattform by outlandish](http://wpackagist.org).

Requirements
------------
* Tested on Chef version 12.2.1. It should work with earlier versions.
* Tested with Ubuntu 14.04 x64, but should work on any Ubuntu.

* Apache2 = 2.4.
* Mysql >= 5.5 as your RDBMS.

Make sure you have a LAMP-Stack running before using this.

Cookbook dependencies
---------------------

`composer`
`openssl`
`database`
`apache2`
`mysql2_chef_gem, github: mychiara/mysql2_chef_gem`

The community cookbook uses a version method in the mysql_provider which causes an error while installing the mysql2_gem.
This error causes chef to (sadly) never succesfully complete the provisioning process.

Recipes
-------

One should only use the default cookbook ;)

Attributes
----------

```ruby

### PRESETS

default['wp_composer']['version'] = '~4'

### FOLDERS AND FILES
default['wp_composer']['base_path'] = '/var/www/html'
default['wp_composer']['public_folder'] = 'public'
default['wp_composer']['install_folder'] = 'wp'
default['wp_composer']['content_folder'] = 'content'
default['wp_composer']['log_dir'] = 'data/log'

default['wp_composer']['application_env'] = 'dev'
default['wp_composer']['log_level'] = 'warn'


### PLUGINS

default['wp_composer']['default_plugins'] = {
    "google-sitemap-generator" => "~4",
    "wp-permalauts" => "~1"
}

### LANG

default['wp_composer']['language'] = 'de_DE'

### DB

default['wp_composer']['db']['host'] = 'localhost'
default['wp_composer']['db']['name'] = 'wpdb_dev'
default['wp_composer']['db']['password'] = 'i am a super save pa$5word, but please change me!?!'
default['wp_composer']['db']['user'] = 'wpdb_dev_user'
default['wp_composer']['db']['prefix'] = 'wpdb_dev_'
default['wp_composer']['db']['root'] = 'root'
default['wp_composer']['db']['server_root_password'] = 'xxx'
default['wp_composer']['db']['privileges'] = [
    "SELECT", "EXECUTE", "SHOW VIEW", "ALTER", "ALTER ROUTINE", "CREATE",
    "CREATE ROUTINE", "CREATE TEMPORARY TABLES", "CREATE VIEW", "DELETE",
    "DROP", "EVENT", "INDEX", "INSERT", "REFERENCES", "TRIGGER", "UPDATE"
]

################################################################################
### REQUIRED ATTRIBUTES

node['wp_composer']['project_name'] = 'mysupercoolwpcomposerproject'
node['wp_composer']['server_name'] = 'mysupercoolwpcomposerproject.com'
node['wp_composer']['server_alias'] = ['mysupercoolwpcomposerproject.com', 'www.mysupercoolwpcomposerproject.com']


### OPTIONAL ATTRIBUTES

node['wp_composer']['user_plugins'] = {
  'plugin-name-from-wpackigst' => '~1',
  '...' => '...',
  'another-plugin-name-from-wpackigst' => '~1'
}

```

Usage
-----
Just include the `composer-wordpress` recipe and set the required attriutes seen above and you should be good to go.

Example usage with a role:
```json
{
    "name": "composer-wordpress",
    "description": "installs and configures wordpress via composer",
    "chef_type": "role",
    "json_class": "Chef::Role",

    "default_attributes": {
        "wp_composer": {
            "project_name": "wpcomposer",
            "server_name": "local.wp-composer",
            "server_aliases": ["local.wp-composer", "wp-composer"],
            "db": {
                "server_root_password": "root"
            }
        }
    },

    "run_list": [
        "role[lamp]",
        "recipe[composer-wordpress]"
    ]
}
```

Contributing
------------

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Author: Andy Ruck::(mychiara+cookbooks@gmail.com)

