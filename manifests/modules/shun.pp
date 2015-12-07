class inspircd::modules::shun (
  $enabledcommands = 'PING PONG QUIT PART JOIN',
  $notifyuser = 'no',
  $affectopers = 'no',
){

  $config = {
    enabledcommands => $enabledcommands,
    notifyuser      => $notifyuser,
    affectopers     => $affectopers,
  }

  ::inspircd::internal::configblock { "inspircd ${name} ":
    config_name => 'shun',
    config      => $config,
    section     => 'modules'
  }

}
