class inspircd::modules::autojoin (
  $channels = [],
){

  $config = {
    channels => join($channels, ','),
  }

  ::inspircd::internal::configblock { "inspircd $name ":
    config_name => 'autojoin',
    config      => $config,
    section     => 'modules'
  }

}
