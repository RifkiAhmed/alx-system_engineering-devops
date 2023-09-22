# Manifest to make changes to our configuration file using puppet
file {'change ssh config':
  ensure  => present,
  path    => '/etc/ssh/ssh_config',
  mode    => '0600',
  content =>'
    # SSH configuration file

    host *
    PasswordAuthentication no
    IdentityFile ~/.ssh/school
    SendEnv LANG LC_*
    HashKnownHosts yes
    GSSAPIAuthentication yes'
}
