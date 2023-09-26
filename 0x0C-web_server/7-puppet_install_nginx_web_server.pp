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

file {'/etc/nginx/sites-available/default':
  ensure  => file,
  content => "
server {
      listen 80 default_server;
      listen [::]:80 default_server;

      root /var/www/html;

      location /redirect_me {
      		return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
      }
}",
  require => Package['nginx'],
  notify  => Service['nginx'],
}
