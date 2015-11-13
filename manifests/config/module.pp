define inspircd::config::module (
  $order = "02",
  $config = {},
  $config_dir = $inspircd::config_dir,
) {

  # Enable module
  concat::fragment { "${config_dir}/modules.conf module ${name}":
    target => "${config_dir}/modules.conf",
    content => template('inspircd/config/types/module.erb'),
    order   => $order
  }

  # If module configuration is available use it.
  if !empty($config) {
    concat::fragment { "${config_dir}/modules.conf module ${name} config":
      target => "${config_dir}/modules.conf",
      content => template('inspircd/config/types/module_config.erb'),
      order   => $order
    }
  }

}
