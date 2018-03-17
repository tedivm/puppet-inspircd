class inspircd::config::insane (
  $hostmasks = $inspircd::params::hostmasks,
  $ipmasks = $inspircd::params::ipmasks,
  $nickmasks = $inspircd::params::nickmasks,
  $trigger = $inspircd::params::trigger,
) inherits inspircd::params {

  $config = {
    hostmasks => $hostmasks,
    ipmasks => $ipmasks,
    nickmasks => $nickmasks,
    trigger => $trigger,
  }

  ::inspircd::internal::configblock { "inspircd ${name}":
    config_name => 'insane',
    config      => $config,
    order       => 29
  }

}
