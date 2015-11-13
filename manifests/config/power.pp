class inspircd::config::power (
  $restartpass = '',
  $diepass = '',
  $hash = false,
) inherits inspircd::params {

  if($hash) {
      $hash_normalized = $hash
      $restartpass_normalized = $restartpass
      $diepass_normalized = $diepass
  } else {

    $hash_normalized = "hmac-sha256"

    $restartpass_hash = pw_hash($restartpass, 'SHA-256', fqdn_rand_string(8, '', "${name} restart pass"))
    $restartpass_normalized = regsubst($restartpass_hash, '^\$5\$', '')

    $diepass_hash = pw_hash($diepass, 'SHA-256', fqdn_rand_string(8, '', "${name} die pass"))
    $diepass_normalized = regsubst($diepass_hash, '^\$5\$', '')

  }

  $config = {
    restartpass => $restartpass_normalized,
    diepass => $diepass_normalized,
    hash => $hash_normalized,
  }

  ::inspircd::internal::configblock { "inspircd $name ":
    config_name => "power",
    config      => $config,
    order       => "08"
  }
}
