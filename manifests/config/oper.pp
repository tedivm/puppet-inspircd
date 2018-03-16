define inspircd::config::oper (
  $password,
  $host,
  $type,
  $hash = false,
  $config_dir = $inspircd::config_dir,
) {

  if($hash) {
      $hash_normalized = $hash
      $password_normalized = $password
  } else {
    $string_hash = pw_hash($password, 'SHA-256', fqdn_rand_string(8, '', $name))
    $password_normalized = regsubst($string_hash, '^\$5\$', '')
    $hash_normalized = 'hmac-sha256'
  }

  $config = {
    name      => $name,
    password  => $password_normalized,
    host      => $host,
    'type'    => $type,
    hash      => $hash_normalized,
  }

  ::inspircd::internal::configblock { "inspircd oper ${name}":
    config_name => 'oper',
    config      => $config,
    section     => 'opers',
    order       => 10
  }

}
