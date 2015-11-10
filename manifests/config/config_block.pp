define inspircd::config::config_block (
  $config = {},
  $order = 10,
  $config_dir = $inspircd::config_dir,
) {

  assert_private('This type is private.')

  concat::fragment { "${config_dir}/inspircd.conf configblock ${name}":
    target => "${config_dir}/inspircd.conf",
    content => template('inspircd/config/types/config_block.erb'),
    order   => $order
  }

}
