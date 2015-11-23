class inspircd::modules::blockcaps (
  $percent,
  $minlen,
  $capsmap="ABCDEFGHIJKLMNOPQRSTUVWXYZ! "
){

  $config = {
    percent => $percent,
    minlen  => $minlen,
    capsmap => $capsmap,
  }

  ::inspircd::internal::configblock { "inspircd $name ":
    config_name => 'blockcaps',
    config      => $config,
    section     => 'modules'
  }

}
