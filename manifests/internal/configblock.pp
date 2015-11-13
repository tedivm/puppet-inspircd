define inspircd::internal::configblock (
  $config_name,
  $config,
  $order = 16,
  $section = 'inspircd',
  $config_dir = $inspircd::config_dir,
) {

  assert_private('This type is private.')

  # If module configuration is available use it.
  if !empty($config) {
    concat::fragment { "${config_dir}/${section}.conf ${section} ${name} config":
      target => "${config_dir}/${section}.conf",
      content => template("inspircd/config/types/module_config.erb"),
      order   => $order + 1
    }
  }

}
