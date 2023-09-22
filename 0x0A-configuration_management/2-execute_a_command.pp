# Create a manifest that kills a process named killmenow, using puppet
# Attributes description:
#  command : command to execute fully qualified
#  onlyif  : test command, Puppet runs this test command first, and only runs the main command if the test has an exit code of 0
exec {'kill killmenow process':
  command => '/usr/bin/pkill -f "killmenow"',
  onlyif  => '/usr/bin/pgrep killmenow',
}
