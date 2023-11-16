# adjusts the file descriptor limit, allowing the Nginx to handle more open files simultaneously,

$ulimit = "/bin/sed -i '/^ULIMIT/s/-n 15/-n 4096/' /etc/default/nginx"
$worker = "/bin/sed -i '/^pid/a \\\nworker_rlimit_nofile 4029;' /etc/nginx/nginx.conf"
$nginx = 'service nginx restart'

exec {'optimize_Nginx_under_stress':
  command => "${ulimit} && ${worker} && ${nginx}",
}

