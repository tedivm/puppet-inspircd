define inspircd::config::exception (
  $reason = undef,
) {

  $config = {
    host   => $name,
    reason => $reason,
  }

  ::inspircd::internal::configblock { "inspircd exception ${name}":
    config_name => 'exception',
    config      => $config,
    order       => '28'
  }

}
