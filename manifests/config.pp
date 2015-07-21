class inspircd::config (

) inherits inspircd::params {

  concat { "${config_dir}/inspircd.conf":
    ensure => 'present',
    content => template('inspircd/config/inspircd.conf.erb'),
    warn => true,
    force => true,
    order => 'numeric',
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
