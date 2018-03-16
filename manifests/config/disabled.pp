class inspircd::config::disabled (
  $commands = $inspircd::params::commands,
  $usermodes = $inspircd::params::usermodes,
  $chanmodes = $inspircd::params::chanmodes,
  $fakenonexistant = $inspircd::params::fakenonexistant,
) inherits inspircd::params {

  $config = {
    commands        => $commands,
    usermodes       => $usermodes,
    chanmodes       => $chanmodes,
    fakenonexistant => $fakenonexistant,
  }

  ::inspircd::internal::configblock { "inspircd ${name} ":
    config_name => 'disabled',
    config      => $config,
    order       => 17
  }


}
