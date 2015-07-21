define inspircd::config::badstuff (
  $type,
  $content,
  $reason,
  $keyname,
  $order = 25,
  $config_dir = $inspircd::config_dir,
) {

  assert_private('This type is private.')

  if $keyname {
    $keyname_norm = $keyname
  } else {
    $keyname_norm = $keyname
  }

  concat::fragment { "${config_dir}/inspircd.conf bad${type} ${content}":
    target => "${config_dir}/inspircd.conf",
    content => template('inspircd/config/types/badstuff.erb'),
    order   => $order
  }

}
