class inspircd::modules::auditorium (
  $showops,
  $operoverride,
){

  $config = {
    showops      => $showops,
    operoverride => $operoverride,
  }

  ::inspircd::internal::configblock { "inspircd ${name} ":
    config_name => 'auditorium',
    config      => $config,
    section     => 'modules'
  }

}
