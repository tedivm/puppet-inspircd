define inspircd::internal::badstuff (
  $type,
  $content,
  $reason,
  $keyname = false,
  $order = "27",
) {

  assert_private('This type is private.')

  $config_base = {
    reason        => $reason,
  }

  if $keyname {
    $config = merge(hash([$keyname, $content]), $config_base)
  } else {
    $config = merge(hash([$type, $content]), $config_base)
  }

  ::inspircd::internal::configblock { "inspircd badstuff ${name}":
    config_name => "bad${type}",
    config      => $config,
    order       => $order
  }

}
