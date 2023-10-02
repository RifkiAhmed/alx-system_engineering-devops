# Install and configure Nginx web server with Puppet
exec {'apt_update':
  command     => 'sudo apt-get update',
  path        => ['/usr/bin', '/usr/sbin'],
  refreshonly => true,
}

package {'nginx':
  ensure  => 'installed',
  require => Exec['apt_update'],
}

exec {'redirection':
  command => "sed -i '/^server {/a\\ \\n\\tlocation /redirect_me {\
return 301 https:\\/\\/www.google.com\\/;}' /etc/nginx/sites-available/default",
  path    => ['/usr/bin', '/usr/sbin'],
  require => Package['nginx'],
}

exec {'header':
  command => "sed -i '/^server {/a\\ \\n\\tadd_header X-Served-By ${hostname};' /etc/nginx/sites-available/default",
  path    => ['/usr/bin', '/usr/sbin'],
  require => Exec['redirection'],
}

exec {'restart':
  command => 'sudo service nginx restart',
  path    => ['/usr/bin', '/usr/sbin'],
  require => Exec['header'],
}
