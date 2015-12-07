define inspircd::config::banlist (
  $chan = $name,
  $limit,
) {

  $config = {
    chan  => $chan,
    limit => $limit,
  }

  ::inspircd::internal::configblock { "inspircd banlist ${chan}":
    config_name => 'banlist',
    config      => $config,
    order       => '16'
  }

}
