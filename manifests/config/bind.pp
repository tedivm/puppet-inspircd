define inspircd::config::bind (
  $address = '',
  $port = '',
  $type = 'client',
  $ssl = false,
  $order = "04",
  $config_dir = $inspircd::config_dir,
) {

  if $ssl {
    $ssl_normalized = "ssl=${ssl} "
  } else {
    $ssl_normalized = ''
  }

  concat::fragment { "${config_dir}/inspircd.conf bind ${name}":
    target => "${config_dir}/inspircd.conf",
    content => template('inspircd/config/types/bind.erb'),
    order   => $order
  }

}
