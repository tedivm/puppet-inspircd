define inspircd::modules::keyword (
  $pattern,
  $reason = '',
  $action = 'none',
  $flags = '-',
  $duration = '',
  $order = 30,
  $config_dir = $inspircd::config_dir,
) {

  concat::fragment { "${config_dir}/modules.conf keyword ${name}":
    target  => "${config_dir}/modules.conf",
    content => template('inspircd/config/types/keyword.erb'),
    order   => $order
  }

}
