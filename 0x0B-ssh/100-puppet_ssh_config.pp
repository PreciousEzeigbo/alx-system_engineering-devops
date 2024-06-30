# Configure the SSH server to authenticates only through SSH keys
include stdlib


# Disable password authentication
file_line { 'Turn off passwd auth':
  ensure => 'present',
  path   => '/etc/ssh/sshd_config',
  line   => 'PasswordAuthentication no',
  match  => '^PasswordAuthentication',
  notify => Exec['reload-sshd'],
}

# Ensure the SSH server uses the specified private key (if applicable)
file_line { 'Declare identity file':
  ensure => 'present',
  path   => '/etc/ssh/sshd_config',
  line   => 'IdentityFile ~/.ssh/holberton',
  match  => '^IdentityFile',
  notify => Exec['reload-sshd'],
}

# Reload SSH service to apply changes
exec { 'reload-sshd':
  command     => '/usr/sbin/service ssh reload',
  refreshonly => true,
}
