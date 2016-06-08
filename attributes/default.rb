default['mediawiki']['web_dir'] = '/var/www/html'
default['mediawiki']['mediawiki_dir'] = 'mediawiki'
default['mediawiki']['install_dir'] = "#{node['mediawiki']['web_dir']}/#{node['mediawiki']['mediawiki_dir']}"
default['mediawiki']['owner'] = 'apache'
default['mediawiki']['group'] = 'apache'

default['mediawiki']['servername'] = 'localhost'

default['mediawiki']['vault'] = 'web_app_secrets'
default['mediawiki']['vault_item'] = 'wiki'

default['mediawiki']['main_version'] = '1.25'
default['mediawiki']['sub_version'] = '.3'

default['mediawiki']['full_version'] = "#{node['mediawiki']['main_version']}#{node['mediawiki']['sub_version']}"

default['mediawiki']['package_url'] = "http://releases.wikimedia.org/mediawiki/#{node['mediawiki']['main_version']}/mediawiki-#{node['mediawiki']['full_version']}.tar.gz"

default['mediawiki']['wgSitename'] = 'Sitename'
default['mediawiki']['wgLogo_remote'] = nil
default['mediawiki']['wgServer'] = "https://#{node['mediawiki']['servername']}:5443"

default['mediawiki']['local_database'] = true
default['mediawiki']['wgDBtype'] = 'postgres'
default['mediawiki']['wgDBname'] = 'wiki'
default['mediawiki']['wgDBport'] = '5432'
default['mediawiki']['wgDBserver'] = '127.0.0.1'

default['mediawiki']['wgBlockDisablesLogin'] = false

default['mediawiki']['ldap'] = true
default['mediawiki']['ldapplugin_url'] = 'https://extdist.wmflabs.org/dist/extensions/LdapAuthentication-REL1_25-d4db6f0.tar.gz'
default['mediawiki']['wgLDAPDomainNames'] = [ 'blah_example_com' ]
default['mediawiki']['wgLDAPServerNames'] = { blah_example_com: 'blah.example.com' }
default['mediawiki']['wgLDAPEncryptionType'] = { blah_example_com: 'ssl' }
default['mediawiki']['wgLDAPSearchAttributes'] = { blah_example_com: 'systemid' }
default['mediawiki']['wgLDAPBaseDNs'] = { blah_example_com: 'ou=peopledc=example,dc=com' }
default['mediawiki']['wgLDAPUseLocal'] = false
default['mediawiki']['wgLDAPPreferences'] = { blah_example_com: "array( 'email' => 'mail')" }
default['mediawiki']['wgLDAPDisableAutoCreate'] = { blah_example_com: false }

# SSL Cert
override['ssl-vault']['certificates'] = ['wiki']
if platform_family?('rhel')
  override['ssl-vault']['private_key_directory'] = '/etc/pki/tls/private'
  override['ssl-vault']['certificate_directory'] = '/etc/pki/tls/certs'
end

# PHP Settings
override['php']['directives'] = { upload_max_filesize: "20M", post_max_size: "20M" }

# Database Configuration
override['postgresql']['enable_pgdg_yum'] = true
override['postgresql']['version'] = '9.3'
override['postgresql']['dir'] = "/var/lib/pgsql/#{node['postgresql']['version']}/data"
override['postgresql']['config']['data_directory'] = "/var/lib/pgsql/#{node['postgresql']['version']}/data"
override['postgresql']['client']['packages'] = %w(postgresql93 postgresql93-devel)
override['postgresql']['server']['packages'] = %w(postgresql93-server)
override['postgresql']['server']['service_name'] = "postgresql-#{node['postgresql']['version']}"
override['postgresql']['contrib']['packages'] = %w(postgresql93-contrib)
override['postgresql']['config']['listen_addresses'] = '0.0.0.0'
override['postgresql']['config']['port'] = node['mediawiki']['wgDBport']
