# Install and configure Nginx web server with Puppet

exec {'apt_update':
  command     => 'apt-get update',
  path        => ['/usr/bin', '/usr/sbin'],
}

package {'nginx':
  ensure  => 'installed',
  require => Exec['apt_update'],
}

exec {'header':
  command => "sed -i '/root \\/var\\/www\\/html;/a\\ \\n\\tadd_header X-Served-By \"${hostname}\";' /etc/nginx/sites-available/default",
  path    => ['/usr/bin', '/usr/sbin'],
  require => Package['nginx'],
}

exec {'restart':
  command => 'service nginx restart',
  path    => ['/usr/bin', '/usr/sbin'],
  require => Exec['header'],
}
