class inspircd::modules::cloak (
  $key = $::inspircd::config::secret,
  $mode = 'half',
  $prefix = 'net-',
){

  $config = {
    key    => $key,
    mode   => $mode,
    prefix => $prefix,
  }

  ::inspircd::internal::configblock { "inspircd $name ":
    config_name => 'cloak',
    config      => $config,
    section     => 'modules'
  }

}
