class inspircd::config::log (
  $method = $inspircd::params::method,
  $target = $inspircd::params::target,
  $type = $inspircd::params::type,
  $level = $inspircd::params::level,
) inherits inspircd::params {

  $config = {
    method => $method,
    target => $target,
    type   => $type,
    level  => $level,
  }

  ::inspircd::internal::configblock { "inspircd ${name}":
    config_name => 'log',
    config      => $config,
    order       => '22'
  }

}
