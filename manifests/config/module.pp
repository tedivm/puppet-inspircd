define inspircd::config::module (
  $config = {},
  $config_dir = $inspircd::config_dir,
) {

  $module_include = {
    name  => "m_${name}.so",
  }

  ::inspircd::internal::configblock { "inspircd module include ${name}":
    config_name => "module",
    config      => $module_include,
    section     => 'modules',
    order       => "02"
  }

  # If module configuration is available use it.
  if !empty($config) {
    ::inspircd::internal::configblock { "inspircd module include ${name} configuration":
      config_name => $name,
      config      => $config,
      section     => 'modules',
      order       => "08"
    }
  }

}
