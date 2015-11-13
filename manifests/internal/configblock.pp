define inspircd::internal::configblock (
  $config_name,
  $config,
  $order = 16,
  $section = 'inspircd',
  $config_dir = $inspircd::config_dir,
) {

  assert_private('This type is private.')

  $elements = count($config)

  if($elements > 2) {
    $template = 'inspircd/config/types/config_block.erb'
  } else {
    $template = 'inspircd/config/types/config_block_short.erb'
  }


  # If module configuration is available use it.
  if !empty($config) {
    concat::fragment { "${config_dir}/${section}.conf ${section} ${name} config":
      target => "${config_dir}/${section}.conf",
      content => template($template),
      order   => $order + 1
    }
  }

}
