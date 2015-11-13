class inspircd::config (

  # ADMIN
  $admin = $inspircd::params::admin,
  $nick = $inspircd::params::nick,
  $email = $inspircd::params::email,

  # BIND PORTS
  $bind_ip = $inspircd::params::bind_ip,
  $bind_port = $inspircd::params::bind_port,

  # FILES
  $motd = $inspircd::params::motd,
  $rules = $inspircd::params::rules,

  # LIMITS
  $maxnick = $inspircd::params::maxnick,
  $maxchan = $inspircd::params::maxchan,
  $maxmodes = $inspircd::params::maxmodes,
  $maxident = $inspircd::params::maxident,
  $maxquit = $inspircd::params::maxquit,
  $maxtopic = $inspircd::params::maxtopic,
  $maxkick = $inspircd::params::maxkick,
  $maxgecos = $inspircd::params::maxgecos,
  $maxaway = $inspircd::params::maxaway,

  # WHOWAS Configuration
  $groupsize = $inspircd::params::groupsize,
  $maxgroups = $inspircd::params::maxgroups,
  $maxkeep = $inspircd::params::maxkeep,

  # GENERAL
  $user = $inspircd::params::user,
  $config_dir = $inspircd::params::config_dir,


  $default_modules = $inspircd::params::default_modules,

) inherits inspircd::params {

  ::inspircd::config::section { 'inspircd':
    include => false
  }

  ::inspircd::config::section { 'links':

  }

  ::inspircd::config::section { 'modules':

  }

  ::inspircd::config::section { 'opers':

  }



  ## Individual Settings

  ::inspircd::config::bind { "default unencrypted port":
    address => $bind_ip,
    port    => $bind_port,
    type    => 'clients',
    ssl     => false,
  }

  ::inspircd::config::module { $default_modules:

  }

  class {"inspircd::config::files":
    motd       => $motd,
    rules      => $rules,
    user       => $user,
    config_dir => $config_dir
  }

  class { 'inspircd::config::limits':
    maxnick  => $maxnick,
    maxchan  => $maxchan,
    maxmodes => $maxmodes,
    maxident => $maxident,
    maxquit  => $maxquit,
    maxtopic => $maxtopic,
    maxkick  => $maxkick,
    maxgecos => $maxgecos,
    maxaway  => $maxaway,
  }

  class { 'inspircd::config::whowas':
    groupsize => $groupsize,
    maxgroups => $maxgroups,
    maxkeep   => $maxkeep,
  }

  class { 'inspircd::config::admin':
    admin => $admin,
    nick  => $nick,
    email => $email,
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
