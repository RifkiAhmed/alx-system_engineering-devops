# Install and configure Nginx web server with Puppet

exec {'apt_update':
  command  => 'apt update',
  provider => shell,
}

package {'nginx':
  ensure   => 'installed',
  provider => apt,
  require  => Exec['apt_update'],
}

exec {'header':
  command => "sed -i '/listen 80 default_server;/a\\ \\n\\tadd_header X-Served-By $hostname;' /etc/nginx/sites-available/default",
  path    => ['/usr/bin', '/usr/sbin'],
  require => Package['nginx'],
}

exec {'restart':
  command  => 'sudo service nginx restart',
  provider => shell,
  require  => Exec['header'],
}
