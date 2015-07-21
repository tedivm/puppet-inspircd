define inspircd::config::module (
  $order = 16,
  $config = {},
  $config_dir = $inspircd::config_dir,
) {

  # Enable module
  concat::fragment { "${config_dir}/inspircd.conf module ${name}":
    target => "${config_dir}/inspircd.conf",
    content => template('inspircd/config/types/module.erb'),
    order   => $order
  }

  # If module configuration is available use it.
  if !empty($config) {
    concat::fragment { "${config_dir}/inspircd.conf module ${name} config":
      target => "${config_dir}/inspircd.conf",
      content => template('inspircd/config/types/module_config.erb'),
      order   => $order + 1
    }
  }

}
