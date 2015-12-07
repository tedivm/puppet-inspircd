class inspircd::service (
  $prefix = $inspircd::params::prefix,
  $service_ensure = $inspircd::params::service_ensure,
) inherits inspircd::params {


  $su = "su ${user} -c"
  $binary = "${prefix}/inspircd"

  service { 'inspircd':
    provider   => 'base',
    ensure     => $service_ensure,
    start      => "${su} \"${binary} start && ${binary} status | grep -q 'InspIRCd is running'\"",
    stop       => "${su} \"${binary} stop\"",
    hasrestart => false,
    restart    => "${su} \"${binary} restart\"",
    hasstatus  => false,
    status     => "${su} \"${binary} status | grep -q 'InspIRCd is running'\"",
  }

}
