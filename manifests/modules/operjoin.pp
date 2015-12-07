class inspircd::modules::operjoin (
  $channels = [],
  $override = 'yes'
){

  $config = {
    channels => join($channels, ','),
  }

  ::inspircd::internal::configblock { "inspircd ${name} ":
    config_name => 'operjoin',
    config      => $config,
    section     => 'modules'
  }

}
