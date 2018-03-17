define inspircd::config::module (
  $config = {},
  $config_dir = $inspircd::config_dir,
) {

  $module_include = {
    name  => "m_${name}.so",
  }

  if(member(['gnutls', 'openssl'], $name)) {
    $order = 2
  }else{
    $order = 8
  }

  ::inspircd::internal::configblock { "inspircd module include ${name}":
    config_name => 'module',
    config      => $module_include,
    section     => 'modules',
    order       => 2
  }

  # If module configuration is available use it.
  if !empty($config) {
    ::inspircd::internal::configblock { "inspircd module include ${name} configuration":
      config_name => $name,
      config      => $config,
      section     => 'modules',
      order       => $order
    }
  }

}
