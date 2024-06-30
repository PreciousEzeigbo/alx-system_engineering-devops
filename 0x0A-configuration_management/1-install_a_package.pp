# Install a package using Puppet

# Install python3.8
package { 'python3.8':
    ensure   => '3.8.10',
    provider => 'pip3',
}

# Install Flask using pip3
package { 'flask':
    ensure   => '2.1.0',
    provider => 'pip3',
}

# Install Werkzeug with a dependency on Flask
package { 'Werkzeug':
    ensure   => '2.1.1',
    provider => 'pip3',
    require  => Package['Flask'],
}

