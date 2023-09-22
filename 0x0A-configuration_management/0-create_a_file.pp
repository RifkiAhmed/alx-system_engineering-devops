# Create a file in /tmp named 'school' using puppet.
# Attributes description :
#  file    : type of the ressource
#  path    : Specifies the path to the file to create
#  owner   : defines owner of the file
#  group   : set the group for the file
#  mode    : set the permissions for the file
#  content : content to be placed inside the file
file {'school':
  path    => '/tmp/school',
  owner   => 'www-data',
  group   => 'www-data',
  mode    => '0744',
  content => 'I love Puppet',
}
