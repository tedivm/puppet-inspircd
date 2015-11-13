define inspircd::internal::badstuff (
  $type,
  $content,
  $reason,
  $keyname = false,
  $order = 25,
  $config_dir = $inspircd::config_dir,
) {

  assert_private('This type is private.')

  if $keyname {
    $keyname_norm = $keyname
  } else {
    $keyname_norm = $type
  }

  concat::fragment { "${config_dir}/inspircd.conf bad${type} ${content}":
    target => "${config_dir}/inspircd.conf",
    content => template('inspircd/config/types/badstuff.erb'),
    order   => $order
  }

}
