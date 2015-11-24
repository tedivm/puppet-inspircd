define inspircd::modules::badchan (
  $allowopers = 'yes',
  $redirect = undef,
  $reason = undef,
){

  $config = {
    name       => $name,
    allowopers => $replacement,
    redirect   => $redirect,
    reason     => $reason,
  }

  ::inspircd::internal::configblock { "inspircd badword $name":
    config_name => "badchan",
    config      => $config,
    section     => 'modules',
    order       => "2"
  }

}
