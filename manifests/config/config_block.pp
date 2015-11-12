define inspircd::config::config_block (
  $config = {},
  $order = 10,
  $config_dir = $inspircd::config_dir,
  $target = "${config_dir}/inspircd.conf",
) {

  assert_private('This type is private.')

  concat::fragment { "$target configblock ${name}":
    target => $target,
    content => template('inspircd/config/types/config_block.erb'),
    order   => $order
  }

}
