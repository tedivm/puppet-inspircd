class inspircd::modules::ident (
  $timeout = '1',
){

  $config = {
    timeout => $timeout,
  }

  ::inspircd::internal::configblock { "inspircd $name ":
    config_name => 'ident',
    config      => $config,
    section     => 'modules'
  }

}
