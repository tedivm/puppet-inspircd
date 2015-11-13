define inspircd::config::dns (
  $server = $name,
  $timeout = 5,
) {

  $config = {
    timeout => $timeout,
    server => $server,
  }

  ::inspircd::internal::configblock { "inspircd dns $name ":
    config_name => "dns",
    config      => $config,
    order       => "03"
  }

}
