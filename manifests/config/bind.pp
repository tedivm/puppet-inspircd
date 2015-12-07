define inspircd::config::bind (
  $address = '',
  $port = '',
  $type = 'client',
  $ssl = undef,
) {

  $config = {
    address  => $address,
    port     => $port,
    type     => $type,
    ssl      => $ssl,
  }

  ::inspircd::internal::configblock { "inspircd bind ${name}":
    config_name => 'bind',
    config      => $config,
    order       => '07'
  }
}
