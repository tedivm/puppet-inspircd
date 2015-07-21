define inspircd::config::exception (
  $pattern,
  $reason = '',
  $action = 'none',
  $flags = '-',
  $duration = '',
  $order = 30,
  $config_dir = $inspircd::config_dir,
) {

  concat::fragment { "${config_dir}/inspircd.conf exception ${name}":
    target => "${config_dir}/inspircd.conf",
    content => template('inspircd/config/types/keyword.erb'),
    order   => $order
  }

}
