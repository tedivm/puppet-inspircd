define inspircd::config::exception (
  $reason,
  $order = 29,
  $config_dir = $inspircd::config_dir,
) {


  concat::fragment { "${config_dir}/inspircd.conf exception ${name}":
    target => "${config_dir}/inspircd.conf",
    content => template('inspircd/config/types/exception.erb'),
    order   => $order
  }

}
