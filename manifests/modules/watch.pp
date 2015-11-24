class inspircd::modules::watch (
  $maxentries = '32',
  $notifyuser = 'no',
  $affectopers = 'no',
){

  $config = {
    maxentries => $maxentries,
  }

  ::inspircd::internal::configblock { "inspircd $name ":
    config_name => 'watch',
    config      => $config,
    section     => 'modules'
  }

}
