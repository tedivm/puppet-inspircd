define inspircd::config::oper (
  $password,
  $host,
  $type,
  $hash = false,
  $order = 10,
  $config_dir = $inspircd::config_dir,
) {

  if($hash) {
      $hash_normalized = "hash=\"${hash}\""
      $password_normalized = $password
  } else {
    $string_hash = pw_hash($password, 'SHA-256', fqdn_rand_string(8, '', $name))
    $password_normalized = regsubst($string_hash, '^\$5\$', '')
    $hash_normalized = 'hash="hmac-sha256"'
  }

  concat::fragment { "${config_dir}/opers.conf oper ${name}":
    target => "${config_dir}/opers.conf",
    content => template('inspircd/config/types/oper.erb'),
    order   => $order
  }

}
