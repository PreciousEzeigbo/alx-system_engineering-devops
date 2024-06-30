# 1-install_a_package.pp

# Ensure pip3 is installed
package { 'python3-pip':
  ensure => installed,
}

# Ensure Flask version 2.1.0 is installed
exec { 'install flask':
  command => '/usr/bin/pip3 install Flask==2.1.0',
  unless  => '/usr/bin/pip3 show Flask | grep -q "Version: 2.1.0"',
  require => Package['python3-pip'],
}
