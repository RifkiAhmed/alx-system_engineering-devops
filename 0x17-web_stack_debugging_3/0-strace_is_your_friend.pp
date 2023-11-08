# Puppet manifest to copy the content file 'default-filters.php' to 'default-filters.phpp' in /var/www/html/wp-includes

file {'.phpp':
  ensure => 'file',
  path   => '/var/www/html/wp-includes/class-wp-locale.phpp',
  source => '/var/www/html/wp-includes/class-wp-locale.php',
}

file {'.php':
  ensure  => 'absent',
  path    => '/var/www/html/wp-includes/class-wp-locale.php',
  require => FILE['.phpp'],
}