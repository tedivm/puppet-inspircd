class inspircd::modules::hidechans (
  $affectsopers = false,
){

  $config = {
    affectsopers => $affectsopers,
  }

  ::inspircd::internal::configblock { "inspircd ${name} ":
    config_name => 'hidechans',
    config      => $config,
    section     => 'modules'
  }

}
