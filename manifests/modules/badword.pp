define inspircd::modules::badword (
  $replacement = '',
){

  $config = {
    name        => $name,
    replacement => $replacement,
  }

  ::inspircd::internal::configblock { "inspircd badword $name":
    config_name => "badword",
    config      => $config,
    section     => 'modules',
    order       => "2"
  }

}
