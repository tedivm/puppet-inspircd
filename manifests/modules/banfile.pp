define inspircd::modules::banfile (
  $pattern,
  $action = 'block'
){

  $config = {
    pattern => $pattern,
    action  => $action,
  }

  ::inspircd::internal::configblock { "inspircd banfile $name":
    config_name => "banfile",
    config      => $config,
    section     => 'modules',
    order       => "2"
  }

}
