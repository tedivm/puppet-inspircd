class inspircd::config (
  $motd = $inspircd::params::motd,
  $rules = $inspircd::params::rules,
  $user = $inspircd::params::user,
  $config_dir = $inspircd::params::config_dir,

  $bind_ip = $inspircd::params::bind_ip,
  $bind_port = $inspircd::params::bind_port,

) inherits inspircd::params {


  # Define and populate base configuration

  concat { "${config_dir}/inspircd.conf":
    ensure => 'present',
    warn   => true,
    force  => true,
    order  => 'numeric',
  }

  concat::fragment { "inspircd base config":
    target  => "${config_dir}/inspircd.conf",
    content => template('inspircd/config/inspircd.conf.erb'),
    order   => '01'
  }


  # Define and populate oper configuration

  concat { "${config_dir}/opers.conf":
    ensure => 'present',
    warn   => true,
    force  => true,
    order  => 'numeric',
  }

  concat::fragment { "inspircd opers config":
    target  => "${config_dir}/opers.conf",
    content => template('inspircd/config/opers.conf.erb'),
    order   => '01'
  }


  # Define and populate links configuration

  concat { "${config_dir}/links.conf":
    ensure => 'present',
    warn   => true,
    force  => true,
    order  => 'numeric',
  }

  concat::fragment { "inspircd links config":
    target  => "${config_dir}/links.conf",
    content => "\n",
    order   => '01'
  }


  ## Individual Settings

  ::inspircd::config::bind { "default unencrypted port":
    address => $bind_ip,
    port    => $bind_port,
    type    => 'client',
    ssl     => false,
  }


  class {"inspircd::config::files":
    motd       => $motd,
    rules      => $rules,
    user       => $user,
    config_dir => $config_dir
  }

  ::inspircd::config::banlist { 'default':
    order => 23,
    chan  => "*",
    limit => "70"
  }

  ::inspircd::config::badnick { $services_users:
    reason => 'Reserved for Services.'
  }

}
