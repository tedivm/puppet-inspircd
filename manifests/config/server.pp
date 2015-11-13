class inspircd::config::server (
  $server = $inspircd::params::server,
  $description = $inspircd::params::description,
  $network = $inspircd::params::network,
) inherits inspircd::params {

  $config = {
    name => $server,
    description => $description,
    network => $network
  }

  ::inspircd::internal::configblock { "inspircd server ":
    config_name => "server",
    config      => $config,
    order       => "02"
  }

}
