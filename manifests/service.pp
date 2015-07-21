class inspircd::service (
  $prefix = $inspircd::params::binary_dir,
  $service_ensure = $inspircd::params::service_ensure,
) inherits inspircd::params {

  $binary = "${prefix}/inspircd"

  service { 'inspircd':
    ensure     => 'running',
    binary     => $service_ensure,
    start      => "${binary} start",
    stop       => "${binary} stop",
    restart    => "${binary} restart",
    status     => "${binary} status | grep -q 'InspIRCd is running'",
    hasrestart => false,
    hasstatus  => false,
  }

}
