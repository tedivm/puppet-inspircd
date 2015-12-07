class inspircd::modules::chanfilter (
  $hidemask,
){

  $config = {
    hidemask => $hidemask,
  }

  ::inspircd::internal::configblock { "inspircd ${name} ":
    config_name => 'chanfilter',
    config      => $config,
    section     => 'modules'
  }

}
