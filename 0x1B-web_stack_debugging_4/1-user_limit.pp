# define hard and soft limits for user holberton regarding the number of open file descriptors (nofile)

exec {'holberton_user_hard_limit':
  command => "/bin/sed -i '/^holberton.*nofile/s/[0-9]\\+/4096/' /etc/security/limits.conf",
}
