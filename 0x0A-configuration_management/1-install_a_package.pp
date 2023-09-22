# Install flask from pip3 using puppet.
# Attributes description:
#  ensure   : Specify the state the package should be in, in this case flask package version 2.1.0
#  name     : The package name to be installed
#  provider : The specific backend to use for this package resource.
package {'install flask':
  ensure   => '2.1.0',
  name     => 'flask',
  provider => 'pip3',
}
