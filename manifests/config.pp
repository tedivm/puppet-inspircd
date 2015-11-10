class inspircd::config (

) inherits inspircd::params {

  concat { "${config_dir}/inspircd.conf":
    ensure => 'present',
    warn => true,
    force => true,
    order => 'numeric',
  }

  concat::fragment { "base config":
    target => "${config_dir}/inspircd.conf",
    content => template('inspircd/config/inspircd.conf.erb'),
    order   => '01'
  }

  ::inspircd::config::banlist { 'default':
    order => 23,
    chan => "*",
    limit => "70"
  }

  ::inspircd::config::badnick { $services_users:
    reason => 'Reserved for Services.'
  }

}
