class inspircd::config::channels (
  $users = $inspircd::params::users,
  $opers = $inspircd::params::opers,
) inherits inspircd::params {

  $config = {
    users => $users,
    oper => $oper,
  }

  ::inspircd::internal::configblock { "inspircd ${name} ":
    config_name => 'channels',
    config      => $config,
    order       => '12'
  }

}
