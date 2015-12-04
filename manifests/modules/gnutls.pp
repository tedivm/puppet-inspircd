class inspircd::modules::gnutls (
  $certfile,
  $keyfile,
  $dhfile = undef,
  $cafile = undef,
  $hash = "sha1",
  $crlfile = undef,
  $dhbits = "1024",
  $priority = "NORMAL:-MD5",
  $generate = true,
){

  $config = {
    certfile => $certfile,
    keyfile  => $keyfile,
    dhfile   => $dhfile,
    cafile   => $cafile,
    crlfile  => $crlfile,
    hash     => $hash,
    dhbits   => $dhbits,
    priority => $priority,
  }

  ::inspircd::internal::configblock { "inspircd $name ":
    config_name => 'gnutls',
    config      => $config,
    section     => 'modules'
  }

  ensure_resource('inspircd::config::module', 'ssl_gnutls')

  if($generate) {
    ensure_resource('class', 'inspircd::internal::certs',{
        certfile => $certfile,
        keyfile  => $keyfile,
        before   => Service['inspircd']
      })
  }

}
