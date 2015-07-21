define inspircd::config::include (
  $path = false,
  $content = false,
  $order = 15,
  $config_dir = $inspircd::config_dir,
) {

  if is_string($path) {
    $fragment_content = "<include file=\"${path}\">"
  }elsif is_string($executable) {
    $fragment_content = "<include executable=\"${path}\">"
  }else{
    fail('Either $path or $executable must be set.')
  }

  concat::fragment { "${config_dir}/inspircd.conf include ${name}":
    target => "${config_dir}/inspircd.conf",
    content => $fragment_content,
    order   => $order
  }

}
