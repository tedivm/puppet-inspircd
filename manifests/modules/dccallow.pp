class inspircd::modules::dccallow (
  $blockchat = 'yes',
  $length = '5m',
  $action = 'block',
){

  $config = {
    blockchat => $blockchat,
    length    => $length,
    action    => $action,
  }

  ::inspircd::internal::configblock { "inspircd $name ":
    config_name => 'dccallow',
    config      => $config,
    section     => 'modules'
  }

}
