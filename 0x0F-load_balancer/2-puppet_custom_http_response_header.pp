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

exec {'header':
  command => "sed -i '/^server {/a\\ \\n\\tadd_header X-Served-By \"${hostname}\";' /etc/nginx/sites-available/default",
  path    => ['/usr/bin', '/usr/sbin'],
  require => Package['nginx'],
}

exec {'restart':
  command => 'sudo service nginx restart',
  path    => ['/usr/bin', '/usr/sbin'],
  require => Exec['header'],
}
