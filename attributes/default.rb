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

default['wp_composer']['db']['host'] = '127.0.0.1'
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