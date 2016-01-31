define inspircd::config::uline (
  $server = '',
  $silent = 'yes',
) {

  $config = {
    server => $server,
    silent => $silent,
  }

  ::inspircd::internal::configblock { "inspircd uline ${server} ":
    config_name => 'uline',
    config      => $config,
    section     => 'links',
    order       => '2',
  }

}
