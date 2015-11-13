class inspircd::config::performance (
  $netbuffersize = $inspircd::params::method,
  $somaxconn = $inspircd::params::somaxconn,
  $limitsomaxconn = $inspircd::params::limitsomaxconn,
  $softlimit = $inspircd::params::softlimit,
  $quietbursts = $inspircd::params::quietbursts,
  $nouserdns = $inspircd::params::nouserdns,
) inherits inspircd::params {

  $config = {
    netbuffersize  => $netbuffersize,
    somaxconn      => $somaxconn,
    limitsomaxconn => $limitsomaxconn,
    softlimit      => $softlimit,
    quietbursts    => $quietbursts,
    nouserdns      => $nouserdns,
  }

  ::inspircd::internal::configblock { "inspircd $name ":
    config_name => "performance",
    config      => $config,
    order       => 15
  }

}
