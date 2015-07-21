define inspircd::config::connect (
  $address = '',
  $port = '',
  $type = 'client',
  $ssl = false,
  $order = 21,
  $config_dir = $inspircd::config_dir,
) {

  concat::fragment { "${config_dir}/inspircd.conf connect ${name}":
    target => "${config_dir}/inspircd.conf",
    content => template('inspircd/config/types/connect.erb'),
    order   => $order
  }

}
