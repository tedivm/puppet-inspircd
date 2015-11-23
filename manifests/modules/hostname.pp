class inspircd::modules::hostname (
  $charmap = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.-_/0123456789',
){

  $config = {
    charmap => $charmap,
  }

  ::inspircd::internal::configblock { "inspircd $name ":
    config_name => 'hostname',
    config      => $config,
    section     => 'modules'
  }

}
