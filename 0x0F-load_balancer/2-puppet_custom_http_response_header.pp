# Install and configure Nginx web server with Puppet

exec {'apt_update':
  command     => 'apt update',
  path        => ['/usr/bin', '/usr/sbin'],
  refreshonly => true,
}

package {'nginx':
  ensure  => 'installed',
  require => Exec['apt_update'],
}

service {'nginx':
  ensure  => 'running',
  enable  => true,
  require => Package['nginx'],
}

exec {'header':
  command => "sed -i '/^\\troot \\/var\\/www\\/html;/a\\ \\n\\tadd_header X-Served-By \"$hostname\";' /etc/nginx/sites-available/default",
  path    => ['/bin', '/usr/bin', '/usr/sbin'],
  require => Package['nginx'],
  notify  => Service['nginx'],
}
