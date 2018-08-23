# Apache ActiveMQ module installs ActiveMQ and manages specific config files
# & firewall rules.

class activemq {

  package { 'apache-activemq':
    ensure => 'installed',
  } ->

  service { 'activemq':
    ensure     => running,
    enable     => true,
    hasrestart => true,
  }

  firewall { '440 ActiveMQ management in':
    chain  => 'INPUT',
    dport  => 8161,
    proto  => tcp,
    action => accept,
  }
  firewall { '441 ActiveMQ openwire in':
    chain  => 'INPUT',
    dport  => 61616,
    proto  => tcp,
    action => accept,
  }
  firewall { '442 ActiveMQ amqp in':
    chain  => 'INPUT',
    dport  => 5672,
    proto  => tcp,
    action => accept,
  }
  firewall { '443 ActiveMQ stomp in':
    chain  => 'INPUT',
    dport  => 61613,
    proto  => tcp,
    action => accept,
  }
  firewall { '444 ActiveMQ mqtt in':
    chain  => 'INPUT',
    dport  => 1883,
    proto  => tcp,
    action => accept,
  }
  firewall { '445 ActiveMQ ws in':
    chain  => 'INPUT',
    dport  => 61614,
    proto  => tcp,
    action => accept,
  }
  file { '/var/log/activemq':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => 0775,
  }
  file { '/opt/activemq/conf/log4j.properties':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template("${module_name}/log4j.properties.erb")
  }
}
