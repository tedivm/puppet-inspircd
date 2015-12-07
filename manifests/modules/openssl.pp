class inspircd::modules::openssl (
  $certfile,
  $keyfile,
  $dhfile = undef,
  $cafile = undef,
  $hash = 'sha1',
  $ciphers = undef,
  $customcontextoptions = undef,
  $cipherserverpref = undef,
  $compression = undef,
  $sslv3 = undef,
  $tlsv1 = undef,
  $generate = true,
){


  $config = {
    cafile               => $cafile,
    certfile             => $certfile,
    keyfile              => $keyfile,
    dhfile               => $dhfile,
    hash                 => $hash,
    ciphers              => $ciphers,
    customcontextoptions => $customcontextoptions,
    cipherserverpref     => $cipherserverpref,
    compression          => $compression,
    sslv3                => $sslv3,
    tlsv1                => $tlsv1,
  }

  ::inspircd::internal::configblock { "inspircd ${name} ":
    config_name => 'openssl',
    config      => $config,
    section     => 'modules'
  }

  ensure_resource('inspircd::config::module', 'ssl_openssl')

  if($generate) {
    ensure_resource('class', 'inspircd::internal::certs',{
        certfile => $certfile,
        keyfile  => $keyfile,
        before   => Service['inspircd']
      })
  }


}
