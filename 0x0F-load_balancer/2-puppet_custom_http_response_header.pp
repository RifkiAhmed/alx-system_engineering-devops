# Install and configure Nginx web server with Puppet

exec {'apt_update':
  command     => 'sudo apt update',
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

file {'/var/www/html/index.html':
  ensure  => file,
  content => 'Hello World!',
  require => Package['nginx'],
}

exec {'redirection':
  command => "sed -i '/^server {/a\\ \\n\\tlocation /redirect_me { return 301 https:\\/\\/www.google.com\\/;}\\n' /etc/nginx/sites-available/default",
  path    => ['/usr/bin', '/usr/sbin'],
  require => Package['nginx'],
  notify  => Service['nginx'],
}

exec {'header':
  command => "sed -i '/^server {/a\\ \\n\\tadd_header X-Served-By \"${hostname}\";' /etc/nginx/sites-available/default",
  path    => ['/usr/bin', '/usr/sbin'],
  require => Package['nginx'],
  notify  => Service['nginx'],
}
